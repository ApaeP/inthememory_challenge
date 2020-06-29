class PagesController < ApplicationController
  def home
  end

  def dashboard
    if params[:country] && params[:country] != ''
      chosen_country = params[:country]
      @sellings = Selling.where(country: chosen_country)
    else
      chosen_country = 'all'
      @sellings = Selling.all
    end

    @total_revenue = total_revenue(chosen_country)
    @average_revenue = @total_revenue.fdiv(number_of_sellings(chosen_country))
    @number_of_customers = number_of_customers(chosen_country)
    @all_countries = Selling.pluck(:country).uniq
  end

  private

  def total_revenue(country)
    rev = 0
    country == 'all' ? Selling.all.each { |sel| rev += (sel.unit_price * sel.quantity) } : Selling.where(country: country).each { |sel| rev += (sel.unit_price * sel.quantity) }
    rev
  end

  def number_of_sellings(country)
    country == 'all' ? Selling.all.size : Selling.where(country: country).size
  end

  def number_of_customers(country)
    country == 'all' ? Customer.all.size : Customer.where(country: country).size
  end

end
