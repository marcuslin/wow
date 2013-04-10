class CharacterEquip < ActiveRecord::Base
  belongs_to :character
  belongs_to :equipment, :counter_cache => :equip_counts

  attr_accessible :character_id, :equipment_id
end

