module PricesHelper
  def format(prices)
    price = prices[0]
    price.to_f/100
  end

  def format_previous(prices)
    diff = prices[0] - prices[1]
    case
    when diff == 0
      "<i class='icon icon-2x icon-resize-vert'></i>".html_safe
    when diff < 0
      "#{diff.abs.to_s}<BR/><i class='icon icon-2x icon-arrow-down'></i>".html_safe
    when diff > 0
      "up"
    end

  end
end
