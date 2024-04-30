module PricesHelper
  def format(prices)
    price = prices[0]
    sprintf("%.2f", price.to_f/100.round(2))
  end

  def format_previous(prices)
    diff = prices[0].to_i - prices[1].to_i
    case
    when diff == 0
      "<i class='icon icon-2x icon-resize-vert'></i>".html_safe
    when diff < 0
      "#{diff.abs.to_s}<BR/><i class='icon icon-2x icon-arrow-down'></i>".html_safe
    when diff > 0
      "<i class='icon icon-2x icon-arrow-up'></i><BR/>#{diff.abs.to_s}".html_safe
    end

  end
end
