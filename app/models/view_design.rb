class ViewDesign < ActiveRecord::Base
  attr_accessible :organization_id, :design_number 
  belongs_to :organization
 
  accepts_nested_attributes_for :organization
end
