class PagesController < ApplicationController
  def home
  end

  def dashboard
    ( params[:country] && params[:country] != '' ) ? chosen_country = params[:country] : chosen_country = 'all'

    @sellings = Selling.select_by_country(chosen_country)
    @total_revenue = Selling.total_revenue(chosen_country).round(2)
    @average_revenue = @total_revenue.fdiv(Selling.number_of_sellings(chosen_country)).round(2)
    @number_of_customers = Customer.number_of_customers(chosen_country)
    @all_countries = Customer.pluck(:country).uniq
  end

end
