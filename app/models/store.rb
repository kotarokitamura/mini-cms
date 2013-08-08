class Store < ActiveRecord::Base
  attr_accessible :organization_id, :store_name
  belongs_to :organizations
end
