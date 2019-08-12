class AddArtistIdToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :artist_id, :integer
  end
end
