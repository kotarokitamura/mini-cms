class Organization < ActiveRecord::Base
  attr_accessible :organization_code, :organization_name, :organization_infos, :stores,:stores_attributes, :organization_infos_attributes
  has_many :organization_infos
  has_many :products
  has_many :stores
  accepts_nested_attributes_for :stores,:organization_infos
end
