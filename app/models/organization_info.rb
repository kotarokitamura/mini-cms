class OrganizationInfo < ActiveRecord::Base
  attr_accessible :organization_id, :phone, :product_information_flag, :store_information_flag
  belongs_to :organization

  validates_format_of :phone,
                      :allow_blank => true,
                      :with => /\d{2,4}-\d{2,4}-\d{4}/

  validates :product_information_flag,
            format: {with:/^[0-1]$/}

  validates :store_information_flag,
            format: {with:/^[0-1]$/}
end
