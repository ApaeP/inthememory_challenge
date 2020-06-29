class PagesController < ApplicationController
  def home
  end

  def dashboard
    params[:country] ? chosen_country = params[:country] : chosen_country = 'all'

    @total_revenue = total_revenue(chosen_country)
    @average_revenue = @total_revenue.fdiv(number_of_sellings(chosen_country))
    @number_of_customers = number_of_customers(chosen_country)
  end

  private

  def total_revenue(country)
    rev = 0
    if country == 'all'
      Selling.all.each { |sel| rev += (sel.unit_price * sel.quantity) }
    else
      Selling.where(country: country).each { |sel| rev += (sel.unit_price * sel.quantity) }
    end
    rev
  end

  def number_of_sellings(country)
    if country == 'all'
      Selling.all.size
    else
      Selling.where(country: chosen_country).size
    end
  end

  def number_of_customers(country)
    if country == 'all'
      Customer.all.size
    else
      Customer.where(country: country).size
    end
  end

end
