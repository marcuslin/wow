require 'HTTParty'

class CharactersData < ActiveRecord::Base
  attr_accessible :race_name, :class_name, :side, :race_id, :class_id

  def self.get_race
    url = "http://tw.battle.net/api/wow/character/races"
        response = HTTParty.get(url)
  end

  def self.get_class
    url = "http://tw.battle.net/api/wow/character/classes"
      response = HTTParty.get(url)
  end
end


