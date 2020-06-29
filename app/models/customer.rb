class Customer < ApplicationRecord
  validates :customer_id, uniqueness: true
  def self.number_of_customers(country)
    country == 'all' ? Customer.all.size : Customer.where(country: country).size
  end
end
