require 'open-uri'

class Character < ActiveRecord::Base
  has_many :realms
  has_many :character_equip
  has_many :equipments, :through => :character_equip
  has_many :users, :through => :realms, :dependent => :destroy

  # class is a reserved word in rails, so we renamed the "class" column.
  attr_accessible :name, :character_class, :race, :gender, :level

  def self.get_profile(realm, charactername)
    url = "http://tw.battle.net/api/wow/character/#{realm}/#{charactername}?fields=items"
    response = JSON.parse(open(url).read)
  end
end

