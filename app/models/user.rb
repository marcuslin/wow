class User < ActiveRecord::Base
  has_many :realms
  has_many :characters, :through => :realms, :dependent => :destroy

  attr_accessible :user_name
end
