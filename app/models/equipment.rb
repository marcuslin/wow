class Equipment < ActiveRecord::Base
  belongs_to :character

  attr_accessible :head, :neck, :shoulder, :back, :chest, :wrist, :hands, :waist, :legs, :feet, :finger_1, :finger_2, :trinket_1, :trinlet_2, :main_hand, :range_weapon, :name, :equipment_id
end

