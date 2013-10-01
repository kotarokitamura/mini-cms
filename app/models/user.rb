class User < ActiveRecord::Base
  attr_accessible :organization_id, :email, :password, :password_confirmation, :remember_me, :first_name, :last_name

  belongs_to :organization

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validate :first_name,
           :length => {:maximum => ResourceProperty.first_name_max_length}
  validate :last_name,
           :length => {:maximum => ResourceProperty.last_name_max_length}
end
