class Product < ActiveRecord::Base
  attr_accessible :organization_id, :product_name
  belongs_to :organization
 
  accepts_nested_attributes_for :organization
  
  validates :product_name,
            :length => {:maximum => ResourceProperty.product_name_max_length }
end
