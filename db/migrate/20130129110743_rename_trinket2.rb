class RenameTrinket2 < ActiveRecord::Migration
  def change
    rename_column :equipment, :trinlet_2, :trinket_2
  end
end
