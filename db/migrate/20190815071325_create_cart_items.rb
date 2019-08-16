class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :record_id
      t.integer :user_id
      t.integer :quantity
      t.datetime :created_at
      t.datetime :edited_at

      t.timestamps
    end
  end
end
