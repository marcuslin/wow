# encoding: UTF-8
require 'open-uri'
class Gems < ActiveRecord::Base
  has_many :equip_gems

  attr_accessible :gem_name, :gem_data, :gem_icon, :gem_type

  def self.get_gemdata(gemnum)
    url = "http://tw.battle.net/api/wow/item/#{gemnum}"
    encoded_uri = URI.encode(url)
    # binding.pry
    JSON.parse(open(encoded_uri).read)
  end
end
