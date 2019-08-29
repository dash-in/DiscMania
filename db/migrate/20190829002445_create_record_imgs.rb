class CreateRecordImgs < ActiveRecord::Migration[5.2]
  def change
    create_table :record_imgs do |t|
      t.integer :record_id
      t.integer :order
      t.string :image_id

      t.timestamps
    end
  end
end
