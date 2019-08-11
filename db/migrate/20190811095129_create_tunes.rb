class CreateTunes < ActiveRecord::Migration[5.2]
  def change
    create_table :tunes do |t|
      t.integer :record_id
      t.integer :disc_no
      t.integer :tune_order

      t.timestamps
    end
  end
end
