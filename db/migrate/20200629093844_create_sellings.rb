class CreateSellings < ActiveRecord::Migration[6.0]
  def change
    create_table :sellings do |t|
      t.date :date
      t.integer :customer_id
      t.integer :order_id
      t.string :country
      t.string :product_code
      t.string :product_description
      t.integer :quantity
      t.float :unit_price

      t.timestamps
    end
  end
end
