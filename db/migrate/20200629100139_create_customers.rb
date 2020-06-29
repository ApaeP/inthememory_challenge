class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.integer :customer_id

      t.timestamps
    end
  end
end
