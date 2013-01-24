class Character < ActiveRecord::Base
  has_many :realms
  has_many :equipments
  has_many :users, :through => :realms, :dependent => :destroy

  # class is a reserved word in rails, so we renamed the "class" column.
  attr_accessible :name, :character_class, :race, :gender, :level

  def self.get_profile(realm, charactername)
    url = "http://tw.battle.net/api/wow/character/#{realm}/#{charactername}?fields=items"
    response = HTTParty.get(url)
  end
end

