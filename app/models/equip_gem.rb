class EquipGem < ActiveRecord::Base
  belongs_to :equipment
  belongs_to :gems

  attr_accessible :equipment_id, :gem_id
end

