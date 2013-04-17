class EquipGem < ActiveRecord::Base
  belongs_to :equipment
  belongs_to :jewel, :counter_cache => :gem_counts

  attr_accessible :equipment_id, :gem_id
end

