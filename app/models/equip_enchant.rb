class EquipEnchant < ActiveRecord::Base
  belongs_to :equipment
  belongs_to :enchant, :counter_cache => :gem_counts

  attr_accessible :equipment_id, :gem_id
end

