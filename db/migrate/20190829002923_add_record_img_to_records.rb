class AddRecordImgToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :record_img_id, :integer
  end
end
