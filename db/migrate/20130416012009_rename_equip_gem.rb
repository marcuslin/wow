class RenameEquipGem < ActiveRecord::Migration
  def change
    rename_table :equip_gem, :equip_gems
  end
end
