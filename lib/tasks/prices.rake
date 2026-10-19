
require "csv"
require "open-uri"
require "bigdecimal"
require "date"

namespace :prices do
  desc "Import historical fuel prices from data.gov.my"
  task import_govmy: :environment do
    source = ENV.fetch(
      "SOURCE",
      "https://storage.data.gov.my/commodities/fuelprice.csv"
    )

    entities = Entity.where.not(govmy_id: [nil, ""])
                     .index_by(&:govmy_id)

    imported = 0
    unchanged = 0
    skipped = 0

    URI.open(source) do |file|
      CSV.new(file, headers: true).each do |row|
        record = row.to_h
        next unless record["series_type"] == "level"

        price_on = Date.iso8601(record.fetch("date"))

        record.each do |field, value|
          next if %w[series_type date].include?(field)

          entity = entities[field]
          next unless entity

          if value.nil? || value.strip.empty?
            skipped += 1
            next
          end

          price_in_sen = (BigDecimal(value) * 100).round.to_i

          price = Price.find_or_initialize_by(
            entity_id: entity.id,
            price_on: price_on
          )

          was_new = price.new_record?

          attributes = {
            entity_name: entity.name,
            price: price_in_sen,
            data: record
          }

          if !was_new && price.attributes.slice(
            "entity_name", "price", "data"
          ) == attributes.stringify_keys
            unchanged += 1
            next
          end

          price.assign_attributes(attributes)
          price.save!

          imported += 1
        end
      end
    end

    puts "Government fuel-price import complete."
    puts "Created/updated: #{imported}"
    puts "Unchanged:       #{unchanged}"
    puts "Skipped blanks:  #{skipped}"
    puts "Mapped entities: #{entities.size}"
  end


  desc "Update latest fuel prices from the government API"
  task update_govmy: :environment do
    require "json"
    require "open-uri"
    require "bigdecimal"
    require "date"

    url = "https://api.data.gov.my/data-catalogue?id=fuelprice&filter=level%40series_type&sort=-date&limit=10"

    response = URI.open(
      url,
      open_timeout: 10,
      read_timeout: 20
    ).read

    records = JSON.parse(response)
    record = records
      .select { |row| row["series_type"] == "level" }
      .max_by { |row| Date.iso8601(row.fetch("date")) }

    raise "No valid government fuel-price record returned" unless record

    price_on = Date.iso8601(record.fetch("date"))

    entities = Entity.where.not(govmy_id: [nil, ""])
                     .index_by(&:govmy_id)

    updated = 0
    unchanged = 0
    skipped = 0

    record.each do |field, value|
      next if %w[series_type date].include?(field)

      entity = entities[field]
      next unless entity

      if value.nil? || value.to_s.strip.empty?
        skipped += 1
        next
      end

      price_in_sen = (BigDecimal(value.to_s) * 100).round.to_i

      price = Price.find_or_initialize_by(
        entity_id: entity.id,
        price_on: price_on
      )

      attributes = {
        entity_name: entity.name,
        price: price_in_sen,
        data: record
      }

      if !price.new_record? &&
          price.attributes.slice("entity_name", "price", "data") ==
            attributes.stringify_keys
        unchanged += 1
        next
      end

      price.assign_attributes(attributes)
      price.save!
      updated += 1
    end

    puts "Government prices updated."
    puts "Effective date: #{price_on}"
    puts "Created/updated: #{updated}"
    puts "Unchanged:       #{unchanged}"
    puts "Skipped blanks:  #{skipped}"
  end


  desc "Update Shell V-Power Racing price from Shell's published workbook"
  task update_shell: :environment do
    require "open-uri"
    require "json"
    require "date"
    require "bigdecimal"
    require "tempfile"
    require "roo"

    model_url = "https://www.shell.com.my/fuels-oils-and-lubricants/shell-fuels/fuelprice.model.json"

    # Discover the current spreadsheet URL from Shell's page model.
    model_response = URI.open(
      model_url,
      open_timeout: 10,
      read_timeout: 20
    ).read

    model = JSON.parse(model_response)
    xlsx_url = nil

    find_xlsx = lambda do |value|
      case value
      when Hash
        if value["name"] == "src" &&
           value["value"].to_s.match?(/\.xlsx(?:\?|$)/i)
          xlsx_url = value["value"]
        else
          value.each_value do |child|
            find_xlsx.call(child) unless xlsx_url
          end
        end
      when Array
        value.each do |child|
          find_xlsx.call(child) unless xlsx_url
        end
      end
    end

    find_xlsx.call(model)

    raise "Could not find Shell's XLSX link in its page model" unless xlsx_url

    Tempfile.create(["shell-fuel-price-", ".xlsx"]) do |file|
      URI.open(
        xlsx_url,
        open_timeout: 10,
        read_timeout: 30
      ) do |response|
        raise "Shell did not return an XLSX file" unless
          response.content_type ==
            "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"

        IO.copy_stream(response, file)
      end

      file.flush

      workbook = Roo::Spreadsheet.open(file.path)

      sheet_name = workbook.sheets.first
      sheet = workbook.sheet(sheet_name)

      price_on = Date.strptime(sheet_name, "%d %B %Y")

      header_row_index = (1..[sheet.last_row, 10].min).find do |index|
        sheet.row(index).map { |cell| cell.to_s.strip }
            .include?("Fuel Product")
      end

      raise "Could not find the fuel-price table header" unless header_row_index

      headers = sheet.row(header_row_index).map do |cell|
        cell.to_s.strip
      end

      product_column = headers.index("Fuel Product")
      peninsula_column = headers.index("Peninsular Malaysia Pump Price")
      east_column = headers.index("East Malaysia Pump Price")

      unless product_column && peninsula_column && east_column
        raise "Unexpected Shell workbook columns: #{headers.inspect}"
      end

      product_row_index = ((header_row_index + 1)..sheet.last_row).find do |index|
        sheet.row(index)[product_column].to_s.strip.casecmp(
          "Shell V-Power Racing"
        ).zero?
      end

      raise "Shell V-Power Racing was not found in the workbook" unless
        product_row_index

      row = sheet.row(product_row_index)

      parse_price = lambda do |value|
        amount =
          if value.is_a?(Numeric)
            BigDecimal(value.to_s)
          else
            match = value.to_s.match(/\ARM\s*([\d,]+(?:\.\d{1,2})?)\z/i)
            raise "Invalid Shell price: #{value.inspect}" unless match

            BigDecimal(match[1].delete(","))
          end

        raise "Invalid price amount: #{value.inspect}" unless amount.positive?

        (amount * 100).round.to_i
      end

      peninsula_price = parse_price.call(row[peninsula_column])
      east_price = parse_price.call(row[east_column])

      entity = Entity.find_by!(name: "VPower")

      price = Price.find_or_initialize_by(
        entity_id: entity.id,
        price_on: price_on
      )

      attributes = {
        entity_name: entity.name,
        price: peninsula_price,
        data: {
          source: "Shell Malaysia fuel-price workbook",
          source_url: xlsx_url,
          model_url: model_url,
          sheet_name: sheet_name,
          product: "Shell V-Power Racing",
          peninsular_price_sen: peninsula_price,
          east_malaysia_price_sen: east_price
        }
      }

      # Avoid updating the record unnecessarily on repeated runs.
      unchanged =
        !price.new_record? &&
        price.entity_name == attributes[:entity_name] &&
        price.price == attributes[:price] &&
        price.data == attributes[:data]

      if unchanged
        puts "Shell price unchanged: RM #{format('%.2f', peninsula_price / 100.0)}"
      else
        price.assign_attributes(attributes)
        price.save!

        puts "Shell price saved."
      end

      puts "Product:       Shell V-Power Racing"
      puts "Effective date: #{price_on}"
      puts "Peninsular:    RM #{format('%.2f', peninsula_price / 100.0)}"
      puts "East Malaysia: RM #{format('%.2f', east_price / 100.0)}"
      puts "Entity ID:     #{entity.id}"
    end
  end




    desc "Update Petron Blaze 100 price from Petron's published pump-price board"
  task update_petron: :environment do
    require "open-uri"
    require "date"
    require "bigdecimal"

    url = "https://www.petron.com.my/"

    html = URI.open(
      url,
      open_timeout: 10,
      read_timeout: 30
    ).read

    # Extract only the pump-price section.
    section_match = html.match(
      /<!--\s*pump prices\s*-->(.*?)<!--\s*end:\s*pump prices\s*-->/im
    )

    raise "Petron pump-price section not found" unless section_match

    section = section_match[1]

    # Example: 15 OCT 2026 - 21 OCT 2026
    date_match = section.match(
      /Pump Price Update Date:\s*(\d{1,2}\s+[A-Z]{3,9}\s+\d{4})\s*-\s*(\d{1,2}\s+[A-Z]{3,9}\s+\d{4})/i
    )

    raise "Petron effective date range not found" unless date_match

    date_format = "%d %b %Y"
    effective_date = Date.strptime(date_match[1].upcase, date_format)
    end_date = Date.strptime(date_match[2].upcase, date_format)

    raise "Invalid Petron effective date range" if end_date < effective_date

    # Match the exact product, not another fuel's price.
    price_match = section.match(
      /PETRON BLAZE 100 EURO 4M:\s*RM\s*([\d]+(?:\.\d{1,2})?)/i
    )

    raise "Petron Blaze 100 price not found" unless price_match

    price_in_sen = (BigDecimal(price_match[1]) * 100).round.to_i

    raise "Invalid Petron price" unless price_in_sen.positive?

    entity = Entity.find(5)

    price = Price.find_or_initialize_by(
      entity_id: entity.id,
      price_on: effective_date
    )

    attributes = {
      entity_name: entity.name,
      price: price_in_sen,
      data: {
        source: "Petron Malaysia pump-price board",
        source_url: url,
        product: "PETRON BLAZE 100 EURO 4M",
        effective_date_range: "#{date_match[1]} - #{date_match[2]}",
        published_price: price_match[0].strip,
        source_section: section.strip
      }
    }

    unchanged =
      !price.new_record? &&
      price.entity_name == attributes[:entity_name] &&
      price.price == attributes[:price] &&
      price.data == attributes[:data]

    if unchanged
      puts "Petron price unchanged."
    else
      price.assign_attributes(attributes)
      price.save!
      puts "Petron price saved."
    end

    puts "Product:       PETRON BLAZE 100 EURO 4M"
    puts "Effective:     #{date_match[1]} - #{date_match[2]}"
    puts "Stored date:   #{effective_date}"
    puts "Price:         RM #{format('%.2f', price_in_sen / 100.0)}"
    puts "Entity ID:     #{entity.id}"
  end




  desc "Update all fuel prices"
  task update_all: :environment do
    tasks = %w[
      prices:update_govmy
      prices:update_shell
      prices:update_petron
    ]

    failures = []

    tasks.each do |task_name|
      puts "\n#{'=' * 60}"
      puts "Running #{task_name}"
      puts '=' * 60

      begin
        Rake::Task[task_name].invoke
      rescue StandardError => e
        failures << [task_name, e]
        warn "FAILED: #{task_name}: #{e.class}: #{e.message}"
      end
    end

    puts "\nFuel price update summary:"
    puts "Successful tasks: #{tasks.size - failures.size}/#{tasks.size}"
    puts "Failed tasks: #{failures.size}"

    failures.each do |task_name, error|
      puts "  #{task_name}: #{error.message}"
    end

    abort "One or more fuel price updates failed" if failures.any?
  end
end
