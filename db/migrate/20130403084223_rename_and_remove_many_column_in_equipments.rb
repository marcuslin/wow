class RenameAndRemoveManyColumnInEquipments < ActiveRecord::Migration
  def change
    rename_column :equipments, :head_icon, :equip_icon
    rename_column :equipments, :head_quality, :equip_quality
    rename_column :equipments, :head_itemlvl, :equip_itemlvl
    rename_column :equipments, :head_stat, :equip_stat
    rename_column :equipments, :head_num, :equip_num
    remove_column :equipments, :neck_icon
    remove_column :equipments, :neck_quality
    remove_column :equipments, :neck_itemlvl
    remove_column :equipments, :neck_stat
    remove_column :equipments, :neck_num
    remove_column :equipments, :shoulder_icon
    remove_column :equipments, :shoulder_quality
    remove_column :equipments, :shoulder_itemlvl
    remove_column :equipments, :shoulder_stat
    remove_column :equipments, :shoulder_num
    remove_column :equipments, :back_icon
    remove_column :equipments, :back_quality
    remove_column :equipments, :back_itemlvl
    remove_column :equipments, :back_stat
    remove_column :equipments, :back_num
    remove_column :equipments, :chest_icon
    remove_column :equipments, :chest_quality
    remove_column :equipments, :chest_itemlvl
    remove_column :equipments, :chest_stat
    remove_column :equipments, :chest_num
    remove_column :equipments, :wrist_icon
    remove_column :equipments, :wrist_quality
    remove_column :equipments, :wrist_itemlvl
    remove_column :equipments, :wrist_stat
    remove_column :equipments, :wrist_num
    remove_column :equipments, :hands_icon
    remove_column :equipments, :hands_quality
    remove_column :equipments, :hands_itemlvl
    remove_column :equipments, :hands_stat
    remove_column :equipments, :hands_num
    remove_column :equipments, :waist_icon
    remove_column :equipments, :waist_quality
    remove_column :equipments, :waist_itemlvl
    remove_column :equipments, :waist_stat
    remove_column :equipments, :waist_num
    remove_column :equipments, :legs_icon
    remove_column :equipments, :legs_quality
    remove_column :equipments, :legs_itemlvl
    remove_column :equipments, :legs_stat
    remove_column :equipments, :legs_num
    remove_column :equipments, :feet_icon
    remove_column :equipments, :feet_quality
    remove_column :equipments, :feet_itemlvl
    remove_column :equipments, :feet_stat
    remove_column :equipments, :feet_num
    remove_column :equipments, :finger_1_icon
    remove_column :equipments, :finger_1_quality
    remove_column :equipments, :finger_1_itemlvl
    remove_column :equipments, :finger_1_stat
    remove_column :equipments, :finger_1_num
    remove_column :equipments, :finger_2_icon
    remove_column :equipments, :finger_2_quality
    remove_column :equipments, :finger_2_itemlvl
    remove_column :equipments, :finger_2_stat
    remove_column :equipments, :finger_2_num
    remove_column :equipments, :trinket_1_icon
    remove_column :equipments, :trinket_1_quality
    remove_column :equipments, :trinket_1_itemlvl
    remove_column :equipments, :trinket_1_stat
    remove_column :equipments, :trinket_1_num
    remove_column :equipments, :trinket_2_icon
    remove_column :equipments, :trinket_2_quality
    remove_column :equipments, :trinket_2_itemlvl
    remove_column :equipments, :trinket_2_stat
    remove_column :equipments, :trinket_2_num
    remove_column :equipments, :main_hand_icon
    remove_column :equipments, :main_hand_quality
    remove_column :equipments, :main_hand_itemlvl
    remove_column :equipments, :main_hand_stat
    remove_column :equipments, :main_hand_num
    remove_column :equipments, :off_hand_icon
    remove_column :equipments, :off_hand_quality
    remove_column :equipments, :off_hand_itemlvl
    remove_column :equipments, :off_hand_stat
    remove_column :equipments, :off_hand_num
  end
end
