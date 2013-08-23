class Store < ActiveRecord::Base
  attr_accessible :organization_id, :store_name
  belongs_to :organization
  
  accepts_nested_attributes_for :organization
end
