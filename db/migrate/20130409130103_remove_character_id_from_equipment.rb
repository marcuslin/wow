class RemoveCharacterIdFromEquipment < ActiveRecord::Migration
  def change
    remove_column :equipments, :character_id
  end
end
