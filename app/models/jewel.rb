# encoding: UTF-8
require 'open-uri'
class Jewel < ActiveRecord::Base
  has_many :equip_gems
  has_many :equipments, :through => :equip_gems

  attr_accessible :gem_name, :gem_data, :gem_icon, :gem_type, :gem_num, :gem_counts

  def self.get_gem_data(gemnum)
    url = "http://tw.battle.net/api/wow/item/#{gemnum}"
    encoded_uri = URI.encode(url)
    # binding.pry
    JSON.parse(open(encoded_uri).read)
  end

  def self.by_jewel_name(jewel_name)
    where(gem_name: jewel_name).first_or_create
  end
end
