class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.text :name
      t.string :image_id
      t.integer :price
      t.text :label
      t.text :genre
      t.integer :stock
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
