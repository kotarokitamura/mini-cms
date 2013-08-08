class Product < ActiveRecord::Base
  attr_accessible :organization_id, :product_name
  belongs_to :organization
end
