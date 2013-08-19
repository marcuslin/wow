# encoding: UTF-8
require 'open-uri'
class Character < ActiveRecord::Base

  CLASS_MAP = Hashie.new(
      '1'  => '戰士',
      '2'  => '聖騎士',
      '3'  => '獵人',
      '4'  => '盜賊',
      '5'  => '牧師',
      '6'  => '死亡騎士',
      '7'  => '薩滿',
      '8'  => '法師',
      '9'  => '術士',
      '10' => '武僧',
      '11' => '德魯伊'
  )

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
  validates_uniqueness_of :name

  def self.by_class(klass)
    where(character_class: klass)
  end

  def self.by_user_id(user_id)
    where(id: user_id)
  end

  def self.count_by_user_char_klass(user_char_klass)
    where(character_class: user_char_klass).count
  end

  def self.by_user_id_char_name(user_id, char_name)
    where(id: user_id, name: char_name).first_or_create!
  end

end

