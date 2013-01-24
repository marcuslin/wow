class Realm < ActiveRecord::Base
  belongs_to :user
  belongs_to :character

  attr_accessible :user_id, :character_id
end