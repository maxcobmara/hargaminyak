module PricesHelper
  def format(prices)
    sprintf("%.2f", prices[0].to_f / 100)
  end

  def format_previous(prices)
    diff = prices[0].to_i - prices[1].to_i

    case
    when diff == 0
      "<i class='icon icon-resize-vert unchanged'></i>".html_safe
    when diff > 0
      "<i class='icon icon-upward increased'></i> <span class='increased'>#{diff}</span>".html_safe
    when diff < 0
      "<i class='icon icon-downward decreased'></i> <span class='decreased'>#{diff.abs}</span>".html_safe
    end
  end


end
