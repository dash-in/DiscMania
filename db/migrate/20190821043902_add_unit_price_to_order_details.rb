class AddUnitPriceToOrderDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :order_details, :unit_price, :integer
  end
end
