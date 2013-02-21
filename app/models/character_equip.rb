class CharacterEquip < ActiveRecord::Base
  belongs_to :character
  belongs_to :equipments

  attr_accessible :character_id, :equipment_id
end

