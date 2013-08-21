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

  def self.get_data(itemNum)
    url = "http://tw.battle.net/api/wow/item/#{itemNum}"
    puts url
    encoded_uri = URI.encode(url)
    # binding.pry
    begin
      JSON.parse(open(encoded_uri).read)
    rescue
      puts "\n\n #{encoded_uri} \n\n"
    end
  end

  def self.calc_equip(equip_counts, char_counts)


    # binding.pry
    equip_calc = Float(equip_counts) / Float(char_counts) * 100
    # count and calculate specific class equip percentage
  end

  def self.by_class_and_part(klass, part)
    where(equip_class: klass, equip_part: part).order('equip_counts DESC').first
  end

  def self.by_random_class(klass, part)
    where(equip_class: klass, equip_part: p).order('equip_counts DESC').first
  end

  def self.by_equip_name(equip_name)
    where(equip_name: equip_name).first_or_create
  end

  def self.equip_part
    %w(head neck shoulder back chest wrist hands
       waist legs feet finger1 finger2 trinket1
       trinket2 mainHand offHand)
  end

  #validates :equip_name, :uniqueness => true
end

