require 'open-uri'

class Character < ActiveRecord::Base
  has_many :realms
  has_many :character_equips
  has_many :equipments, :through => :character_equips
  has_many :users, :through => :realms, :dependent => :destroy

  # class is a reserved word in rails, so we renamed the "class" column.
  attr_accessible :name, :character_class, :race, :gender, :level

  def self.get_profile(realm, charactername)
    url = "http://tw.battle.net/api/wow/character/#{realm}/#{charactername}?fields=items"
    #JSON.parse(open(url).read)
    JSON.parse(File.open("#{Rails.root}/app/models/burningangel.json").read)
  end
end

