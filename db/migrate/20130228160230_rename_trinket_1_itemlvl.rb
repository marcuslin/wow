class RenameTrinket1Itemlvl < ActiveRecord::Migration
  def change
    rename_column :equipment, :trinket_itemlvl, :trinket_1_itemlvl
  end
end
