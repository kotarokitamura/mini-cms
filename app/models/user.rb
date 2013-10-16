class User < ActiveRecord::Base
  attr_accessible :organization_id, :email, :password, :password_confirmation, :remember_me, :first_name, :last_name

  has_many :organizatoins_users
  has_many :organizations, :through => :organization_users 

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
