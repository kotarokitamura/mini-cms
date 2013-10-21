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
                  :images_attributes,
                  :users,
                  :users_attributes

  has_many :organization_infos
  has_many :stores
  has_many :view_designs
  has_many :products
  has_many :images
  has_many :members
  has_many :users, :through => :members, :source => :user

  accepts_nested_attributes_for :stores,
                                :organization_infos,
                                :view_designs,
                                :products,
                                :images,
                                :users
 
  validates :organization_code,
            :length => {:maximum => ResourceProperty.organization_code_max_length},
            :presence => true

  validates_uniqueness_of :organization_code,
                          :case_sensitive => false

  validates_format_of :organization_code,
                      :with => /\A[a-z0-9]+\z/

  validates :organization_name,
            :length => {:maximum => ResourceProperty.organization_name_max_length}

  def first_create
    build_relationships
    change_admin_flag_on
    self.save
  end

  def build_relationships
    ResourceProperty.organization_max_item.times{
      self.stores.build
      self.products.build
      self.organization_infos.build
    }
    self.view_designs.build
    self.images.build
  end

  def change_admin_flag_on
    self.users.first.admin_flag = ResourceProperty.admin_flag_on
  end

  def access_filter?(current_user)
    self.members.map(&:user_id).include?(current_user.id)
  end
end
