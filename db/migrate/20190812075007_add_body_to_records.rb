class AddBodyToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :body, :text
  end
end
