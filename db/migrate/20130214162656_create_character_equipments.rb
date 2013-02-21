class CreateCharacterEquipments < ActiveRecord::Migration
  def change
    create_table :character_eqip do |t|
      t.references :character_id
      t.references :equipment_id
    end
  end
end
