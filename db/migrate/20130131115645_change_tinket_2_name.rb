class ChangeTinket2Name < ActiveRecord::Migration
  def change
    rename_column :equipment, :trinlet_2_num, :trinket_2_num
  end
end
