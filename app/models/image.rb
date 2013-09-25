class Image < ActiveRecord::Base
  attr_accessible :organization_id, :logo_file_name, :logo_content_type, :logo_file_size, :logo_updated_at 
  belongs_to :organization  

  accepts_nested_attributes_for :organization

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/system/missing/:style/missing.jpg"

  validates_attachment :logo,
    content_type: { content_type: ["image/jpg", "image/png"] },
    size: { less_than: 2.megabytes }
end
