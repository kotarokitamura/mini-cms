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

  def self.admin_user?(current_user)
    current_user.admin_flag == ResourceProperty.admin_flag_on
  end
end
