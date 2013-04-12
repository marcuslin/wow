class Equipment < ActiveRecord::Base
  set_table_name 'equipments'
  has_many :character_equips
  has_many :characters

  attr_accessible :equip_part, :equip_name, :equip_icon, :equip_quality, :equip_itemlvl, :equip_stat, :character_id,
                  :equip_num, :equip_counts, :equip_class

  attr_accessor :percentage

  validates :equip_name, :uniqueness => true
end

