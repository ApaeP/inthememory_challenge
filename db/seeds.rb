# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_path = 'db/memory-tech-challenge-data.csv'
csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }

puts "\n Destroy DB"
  Customer.destroy_all
  Selling.destroy_all
puts "DB Destroyed\n "

puts "Create DB from CSV"

#Create an array for import
sellings = []
customers = []
nb = 0

CSV.foreach(csv_path, csv_options) do |row|
  nb += 1
  sellings << Selling.new(
    date: row['date'].to_date,
    customer_id: row['customer_id'],
    order_id: row['order_id'],
    country: row['country'],
    product_code: row['product_code'],
    product_description: row['product_description'],
    quantity: row['quantity'],
    unit_price: row['unit_price'])

  unless Customer.find_by(customer_id: row['customer_id'])
    customers << Customer.new(customer_id: row['customer_id'], country: row['country'])
  end
   break if nb > 10000
end

Selling.import(sellings)
Customer.import(customers)

puts "DB created"


