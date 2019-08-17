class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :shipping_info_id
      t.string :payment_method
      t.integer :actual_shipping
      t.float :actual_tax
      t.integer :total_price
      t.integer :receipt_status
      t.integer :shipping_status

      t.timestamps
    end
  end
end
