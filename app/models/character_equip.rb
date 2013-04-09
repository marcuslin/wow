class CharacterEquip < ActiveRecord::Base
  belongs_to :character
  belongs_to :equipment, :counter_cache => true

  attr_accessible :character_id, :equipment_id
end

