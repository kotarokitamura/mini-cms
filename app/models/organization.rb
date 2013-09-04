class Organization < ActiveRecord::Base
  attr_accessible :organization_code, 
                  :organization_name, 
                  :stores,
                  :stores_attributes, 
                  :organization_infos, 
                  :organization_infos_attributes, 
                  :view_designs, 
                  :view_designs_attributes

  has_many :organization_infos
  has_many :products
  has_many :stores
  has_many :view_designs

  accepts_nested_attributes_for :stores,
                                :organization_infos,
                                :view_designs
 
  validates :organization_code,
            :length => {:maximum => 20},
            :presence => true

  validates_uniqueness_of :organization_code, 
                          :case_sensitive => false 

  validates_format_of :organization_code, 
                      :with => /\A[a-z0-9]+\z/

  validates :organization_name,
            :length => {:maximum => 100},
            :presence => true
  
end
