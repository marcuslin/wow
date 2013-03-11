class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model, :password_confirmation
  attr_accessible :email, :password, :remember_me, :realms, :chracter_name, :user_name
  has_many :realms
  has_many :characters, :through => :realms, :dependent => :destroy

end
