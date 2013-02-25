class Equipment < ActiveRecord::Base
  has_many :character_equips
  has_many :characters, :through => :character_equips

  attr_accessible :head, :neck, :shoulder, :back, :chest, :wrist, :hands, :waist, :legs, :feet, :finger_1, :finger_2, :trinket_1, :trinket_2, :main_hand, :off_hand, :character_id
end

