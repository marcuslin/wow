class CharacterEquip < ActiveRecord::Base
  belongs_to :character
  belongs_to :equipment

  attr_accessible :character_id, :equipment_id
end

