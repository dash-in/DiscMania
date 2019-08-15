class CreateShippingInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_infos do |t|
      t.integer :user_id
      t.string :name
      t.text :post_number
      t.text :address

      t.timestamps
    end
  end
end
