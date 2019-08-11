class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.integer :name
      t.text :description
      t.detetime :deleted_at
      t.detetime :created_at
      t.detetime :dedited_at

      t.timestamps
    end
  end
end
