class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.integer :shipping
      t.float :tax
      t.text :shop_address
      t.text :shop_tel

      t.timestamps
    end
  end
end
