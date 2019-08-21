class Tune < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tunes, :disc_no, 1
  end
end
