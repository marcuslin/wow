class CreateCharacterEquipTable < ActiveRecord::Migration
  def change
    create_table :character_equip do |t|
      t.references :character_id
      t.references :equipment_id

      t.timestamps
    end
  end
end
