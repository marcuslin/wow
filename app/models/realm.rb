class Realm < ActiveRecord::Base
  belongs_to :user
  belongs_to :character

  validates :name, :presence => true

  attr_accessible :user_id, :character_id
end