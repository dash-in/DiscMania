class Order < ActiveRecord::Migration[5.2]
  def change
    change_column_default :orders, :receipt_status, 0
    change_column_default :orders, :shipping_status, 0
  end
end
