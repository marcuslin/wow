class Equipment < ActiveRecord::Base
  self.table_name = 'equipments'
  has_many :character_equips
  has_many :characters, :through => :character_equips
  has_many :equip_gems
  has_many :jewels, :through => :equip_gems
  has_many :equip_enchants
  has_many :enchants, :through => :equip_enchants

  attr_accessible :equip_part, :equip_name, :equip_icon, :equip_quality, :equip_itemlvl, :equip_stat, :character_id,
                  :equip_num, :equip_counts, :equip_class, :gem0_num, :gem1_num

  attr_accessor :percentage

  #validates :equip_name, :uniqueness => true
end

