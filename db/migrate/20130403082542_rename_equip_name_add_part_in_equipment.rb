class RenameEquipNameAddPartInEquipment < ActiveRecord::Migration
  def change
    remove_column :equipments, :head
    remove_column :equipments, :neck
    remove_column :equipments, :shoulder
    remove_column :equipments, :back
    remove_column :equipments, :chest
    remove_column :equipments, :wrist
    remove_column :equipments, :hands
    remove_column :equipments, :waist
    remove_column :equipments, :legs
    remove_column :equipments, :feet
    remove_column :equipments, :finger_1
    remove_column :equipments, :finger_2
    remove_column :equipments, :trinket_1
    remove_column :equipments, :trinket_2
    rename_column :equipments, :main_hand, :equip_part
    rename_column :equipments, :off_hand, :equip_name
  end
end
