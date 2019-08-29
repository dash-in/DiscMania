class RemoveImageIdFromRecords < ActiveRecord::Migration[5.2]
  def change
    remove_column :records, :image_id, :string
  end
end
