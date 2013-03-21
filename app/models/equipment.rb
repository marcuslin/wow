class Equipment < ActiveRecord::Base
  set_table_name 'equipments'
  has_many :character_equips
  has_many :characters, :through => :character_equips

  attr_accessible :head, :head_icon, :head_quality, :head_itemlvl, :head_stat, :neck, :neck_icon, :neck_quality, :neck_itemlvl, :neck_stat, :shoulder, :shoulder_icon, :shoulder_quality, :shoulder_itemlvl, :shoulder_stat, :back, :back_icon, :back_quality, :back_itemlvl, :back_stat, :chest, :chest_icon, :chest_quality, :chest_itemlvl, :chest_stat, :wrist, :wrist_icon, :wrist_quality, :wrist_itemlvl, :wrist_stat, :hands, :hands_icon, :hands_quality, :hands_itemlvl, :hands_stat, :waist, :waist_icon, :waist_quality, :waist_itemlvl, :waist_stat, :legs, :legs_icon, :legs_quality, :legs_itemlvl, :legs_stat, :feet, :feet_icon, :feet_quality, :feet_itemlvl, :feet_stat, :finger_1, :finger_1_icon, :finger_1_quality, :finger_1_itemlvl, :finger_1_stat, :finger_2, :finger_2_icon, :finger_2_quality, :finger_2_itemlvl, :finger_2_stat, :trinket_1, :trinket_1_icon, :trinket_1_quality, :trinket_1_itemlvl, :trinket_1_stat, :trinket_2, :trinket_2_icon, :trinket_2_quality, :trinket_2_itemlvl, :trinket_2_stat, :main_hand, :main_hand_icon, :main_hand_quality, :main_hand_itemlvl, :main_hand_stat, :off_hand, :off_hand_icon, :off_hand_quality, :off_hand_itemlvl, :off_hand_stat, :character_id
end

