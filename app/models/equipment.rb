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

  def self.equip_parts
    equip_parts = %w(head neck shoulder back chest wrist hands
                  waist legs feet finger1 finger2 trinket1
                  trinket2 mainHand offHand)
  end

  def self.random_klass
    random_klass = rand(1..11)
  end

  def self.choose_klass(chosenKlass)

    equip_klass_num = chosenKlass['klass']
    # binding.pry
  end


  def self.get_klass_equip_stats_num(chosen_klass)
    testing =[]


    self.equip_parts.each do |p|

      @equip_obj = Equipment.where(equip_class: chosen_klass, equip_part: p).order("equip_counts DESC").first
      next if @equip_obj.blank?
      # equip[p] = @equip_obj
    # binding.pry
      self.save_untrans
    testing << JSON.parse(@equip_obj.equip_stat)
    next if testing.blank?
    end
    testing
    # binding.pry
  end

  def self.save_untrans
    equip = {}
    self.equip_parts.each do |e|
      equip[e] = @equip_obj
    end
    equip
    # binding.pry
  end

  def self.get_stats_info(stats_details)
    BonusStat.where(stats_num: stats_details).first
  end

  #validates :equip_name, :uniqueness => true
end

