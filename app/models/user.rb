class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model, :password_confirmation
  attr_accessible :email, :password, :password_confirmation, :remember_me, :realms, :characters, :user_name
  has_many :realms
  has_many :characters, :through => :realms, :dependent => :destroy
  #
  has_many :assignments
  has_many :roles, :through => :assignments

  def is_admin?
    # self.admin == true is redundant
    self.admin
  end
end