require 'csv'

csv_path = 'db/memory-tech-challenge-data.csv'
csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }

puts "\n Destroy DB"
  Customer.destroy_all
  Selling.destroy_all
puts "DB Destroyed\n "

puts "Create DB from CSV"

#Create arrays for import gem
puts "initialize empty arrays"
sellings = []
customers = []
customer_ids = []
nb = 0

puts "\n Start parsing CSV file\n "
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

  unless customer_ids.include?(row['customer_id'])
    customer_ids << row['customer_id']
    customers << Customer.new(customer_id: row['customer_id'], country: row['country'])
  end
  p nb
   # break if nb > 50000
end
puts "\n CSV Parsing finished\n "

puts "\n Importation of arrays in DB"
puts "\n Sellings..."
Selling.import(sellings)
puts "Sellings import done\n "
puts "\n Customers..."
Customer.import(customers)
puts "Customers import done\n "
puts "\n Arrays imported"

puts "DB created"


