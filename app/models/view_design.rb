class ViewDesign < ActiveRecord::Base
  attr_accessible :organization_id, :design_number 
  belongs_to :organization

  accepts_nested_attributes_for :organization

  validates_numericality_of :design_number,
                            :only_integer => true,
                            :greater_than_or_equal_to => 0,
                            :allow_nil => false
end
