class ViewDesign < ActiveRecord::Base
  attr_accessible :organization_id, :design_number 
  belongs_to :organization
end
