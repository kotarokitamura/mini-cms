require 'spec_helper'

describe Image do
  it { should have_attached_file(:logo) }
  it { should validate_attachment_content_type(:logo).
                allowing('image/jpg', 'image/png') }
  it { should validate_attachment_size(:logo).
                less_than(2.megabytes) }
end
