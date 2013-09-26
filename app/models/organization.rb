class Organization < ActiveRecord::Base
  attr_accessible :organization_code, 
                  :organization_name, 
                  :stores,
                  :stores_attributes, 
                  :organization_infos, 
                  :organization_infos_attributes, 
                  :view_designs, 
                  :view_designs_attributes,
                  :products,
                  :products_attributes,
                  :images,
                  :images_attributes

  has_many :organization_infos
  has_many :stores
  has_many :view_designs
  has_many :products
  has_many :images

  accepts_nested_attributes_for :stores,
                                :organization_infos,
                                :view_designs,
                                :products,
                                :images
 
  validates :organization_code,
            :length => {:maximum => ResourceProperty.organization_code_max_length},
            :presence => true

  validates_uniqueness_of :organization_code, 
                          :case_sensitive => false 

  validates_format_of :organization_code, 
                      :with => /\A[a-z0-9]+\z/

  validates :organization_name,
            :length => {:maximum => ResourceProperty.organization_name_max_length},
            :presence => true

  default_scope :order => 'created_at DESC'
  paginates_per 1 
end
