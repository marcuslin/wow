class CharacterEquip < ActiveRecord::Base
  belongs_to :character
  belongs_to :equipment, :counter_cache => :equip_counts

  attr_accessible :character_id, :equipment_id

  def self.by_user_id_equip_id(user_id, equip_id)
    where(character_id: user_id, equipment_id: equip_id)
  end
end

