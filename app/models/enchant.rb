#encoding: UTF-8
require 'open-uri'
class Enchant < ActiveRecord::Base
  has_many :equip_enchants
  has_many :equipments, :through => :equip_enchants

  attr_accessible :enchant_num, :enchant_name, :enchant_icon

  def self.get_enchant(enchantnum)
    url = "http://tw.battle.net/api/wow/item/#{enchantnum}"
    encoded_uri = URI.encode(url)
    # binding.pry
    JSON.parse(open(encoded_uri).read)
  end
end
