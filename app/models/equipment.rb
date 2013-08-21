# encoding: UTF-8
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

  PART_MAP = Hashie::Mash.new(
    'head' => '頭部',
    'neck' => '頸部',
    'shoulder' => '肩部',
    'back' => '背部',
    'chest' => '胸部',
    'wrist' => '手腕',
    'hands' => '手',
    'waist' => '腰部',
    'legs' => '腿部',
    'feet' => '腳',
    'finger1' => '戒指1',
    'finger2' => '戒指2',
    'trinket1' => '飾品1',
    'trinket2' => '飾品2',
    'mainHand' => '主手',
    'offHand' => '副手'
  )

  def self.get_data(item_num)
    url = "http://tw.battle.net/api/wow/item/#{item_num}"
    puts url
    encoded_uri = URI.encode(url)
    # binding.pry
    begin
      JSON.parse(open(encoded_uri).read)
    rescue
      puts "\n\n #{encoded_uri} \n\n"
    end
  end

  def self.by_class_and_part(klass, part)
    where(equip_class: klass, equip_part: part).order('equip_counts DESC').first
  end

  def self.search_by_class_and_part(klass, part)
    where(equip_class: klass, equip_part: part)
  end

  def self.create_by_equip_name(equip_name)
    where(equip_name: equip_name).first_or_create
  end

  def self.search_by_equip_name(equip_name)
    where(equip_name: equip_name)
  end
end

