class User < ActiveRecord::Base
  attr_accessible :organization_id,
                  :email,
                  :password,
                  :password_confirmation,
                  :remember_me,
                  :first_name,
                  :last_name,
                  :admin_flag,
                  :organizations_users,
                  :organizations_users_attributes,
                  :organizations,
                  :organizations_attributes

  has_many :members
  has_many :organizations, :through => :members,:source => :organization


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
