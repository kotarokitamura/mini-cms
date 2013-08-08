class Organization < ActiveRecord::Base

  attr_accessible :organization_code, :organization_name
  has_many :organization_infos
  has_many :products
  has_many :stores

end
