class AddShippingNameToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :shipping_name, :text
  end
end
