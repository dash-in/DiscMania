class RemoveRecordImgFromRecords < ActiveRecord::Migration[5.2]
  def change
    remove_column :records, :record_img_id, :integer
  end
end
