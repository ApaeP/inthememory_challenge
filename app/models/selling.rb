class Selling < ApplicationRecord

  def self.select_by_country(country)
    country == 'all' ? Selling.all : Selling.where(country: country)
  end

  def self.total_revenue(country)
    rev = 0
    country == 'all' ? Selling.all.each { |sel| rev += (sel.unit_price * sel.quantity) } : Selling.where(country: country).each { |sel| rev += (sel.unit_price * sel.quantity) }
    rev
  end

  def self.number_of_sellings(country)
    country == 'all' ? Selling.all.size : Selling.where(country: country).size
  end

end
