class RenameGemIdInEquipGems < ActiveRecord::Migration
  def change
    rename_column :equip_gems, :gem_id, :jewel_id
  end
end
