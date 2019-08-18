class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :record_id
      t.integer :order_id
      t.integer :quantity
      t.integer :price

      t.timestamps
    end
  end
end
