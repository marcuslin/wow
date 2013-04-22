class CreateEquipEnchants < ActiveRecord::Migration
  def change
    create_table :equip_enchants do |t|
      t.references :enchant
      t.references :equipment

      t.timestamps
    end
  end
end
