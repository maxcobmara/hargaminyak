class PagesController < ApplicationController
  def home
    @kuning = Price.kuning.limit(2).pluck(:price)
    @hijau = Price.hijau.limit(2).pluck(:price)
    @hitam = Price.hitam.limit(2).pluck(:price)
    @biru = Price.biru.limit(2).pluck(:price)
  end

  def chart
  end

  def about
  end
end
