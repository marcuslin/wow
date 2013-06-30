# encoding: UTF-8
require 'open-uri'
class Character < ActiveRecord::Base
  attr_accessible :name, :character_class, :race, :gender, :level, :realm

  has_many :character_equips
  has_many :equipments, :through => :character_equips
  belongs_to :user, :dependent => :destroy

  # class is a reserved word in rails, so we renamed the "class" column.

  def self.get_profile(realm, charactername)
    url = "http://tw.battle.net/api/wow/character/#{realm}/#{charactername}?fields=items"
    puts url
    encoded_uri = URI.encode(url)
    # binding.pry
    begin
      JSON.parse(open(encoded_uri).read)
    rescue
      puts "\n\n #{encoded_uri} \n\n"
    end
    # JSON.parse(File.open("#{Rails.root}/app/models/burningangel.json").read)
  end
  validates :name, :realm,  :presence => true
end

