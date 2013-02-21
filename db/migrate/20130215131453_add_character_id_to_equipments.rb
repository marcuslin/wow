class AddCharacterIdToEquipments < ActiveRecord::Migration
  def change
    add_column :equipments, :character_id, :integer
  end
end
