class PagesController < ApplicationController
  allow_unauthenticated_access only: %i[ home chart about ]

  def home
    all_entities = Entity.includes(:prices).to_a
    entities_by_govmy_id = all_entities.index_by(&:govmy_id)
    entities_by_id = all_entities.index_by(&:id)

    if params[:ron95] == "skps"
      rows = [
        [entities_by_govmy_id["ron95_skps"], "kuning"],
        [entities_by_govmy_id["diesel_skds"], "hitam"]
      ]
    else

      ron95_field =
        params[:ron95] == "budi95" ? "ron95_budi95" : "ron95"

      diesel_field =
        if params[:diesel] == "eastmsia"
          "diesel_eastmsia"
        elsif params[:ron95] == "budi95"
          "diesel_budi"
        else
          "diesel"
        end

      rows = [
        [entities_by_govmy_id[ron95_field], "kuning"],
        [entities_by_id[2], "hijau"],
        [entities_by_govmy_id[diesel_field], "hitam"],
        [entities_by_id[4], "biru"],
        [entities_by_id[5], "blaze"],
        [entities_by_id[6], "merah"]
      ]
    end


    @prices = rows.filter_map do |entity, identifier|
      next unless entity

      records = entity.prices.limit(2)
      next if records.empty?

      {
        identifier: identifier,
        title: entity.name,
        description: entity.description,
        values: records.map(&:price)
      }
    end

    @stretched_mode = params[:ron95] == "skps"
  end


  def chart
    case params[:search]
    when "1M"
      start = 1.months.ago
    when "3M"
      start = 3.months.ago
    when "6M"
      start = 6.months.ago
    when "1Y"
      start = 1.years.ago
    when "3Y"
      start = 3.years.ago
    when "5Y"
      start = 5.years.ago
    else
      start = 100.years.ago
    end
    @prices = Price.unscoped.where(price_on: [start..Date.today]).group(:entity_name).group_by_week(:price_on).sum(:price)

  end

  def about
  end
end
