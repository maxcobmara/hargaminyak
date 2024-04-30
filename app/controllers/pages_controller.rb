class PagesController < ApplicationController
  def home
    @kuning = Price.kuning.limit(2).pluck(:price)
    @hijau  = Price.hijau.limit(2).pluck(:price)
    @hitam  = Price.hitam.limit(2).pluck(:price)
    @biru   = Price.biru.limit(2).pluck(:price)
    @blaze  = Price.blaze.limit(2).pluck(:price)
    @merah  = Price.merah.limit(2).pluck(:price)
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
