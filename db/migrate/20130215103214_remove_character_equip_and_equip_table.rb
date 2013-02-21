class RemoveCharacterEquipAndEquipTable < ActiveRecord::Migration
  def change
    drop_table :character_eqip
    drop_table :equipments
  end
end
