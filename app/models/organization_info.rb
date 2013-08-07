class OrganizationInfo < ActiveRecord::Base
  attr_accessible :organization_id, :phone, :product_information_flag, :store_information_flag
end
