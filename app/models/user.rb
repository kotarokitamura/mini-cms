class User < ActiveRecord::Base
  attr_accessible :organization_id, :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  belongs_to :organization
  accepts_nested_attributes_for :organization
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model

end
