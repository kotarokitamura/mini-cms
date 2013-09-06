class Product < ActiveRecord::Base
  attr_accessible :organization_id, :product_name
  belongs_to :organization
  
  validates :product_name,
            :length => {:maximum => 50}
end
