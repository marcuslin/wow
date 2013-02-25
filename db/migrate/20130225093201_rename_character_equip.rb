class RenameCharacterEquip < ActiveRecord::Migration
  def change
    rename_table :character_equip, :character_equips
  end
end
