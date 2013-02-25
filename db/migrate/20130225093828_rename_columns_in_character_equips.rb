class RenameColumnsInCharacterEquips < ActiveRecord::Migration
  def change
    rename_column :character_equips, :character_id_id, :character_id
    rename_column :character_equips, :equipment_id_id, :equipment_id
  end
end
