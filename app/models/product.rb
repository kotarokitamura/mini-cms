class Product < ActiveRecord::Base
  attr_accessible :organization_id, :product_name
  belongs_to :organization
  
  validates :product_name,
            :length => {:maximum => ResourceProperty.product_name_max_length }
end
