class RemoveDlFlgFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :dl_flg, :boolean
  end
end
