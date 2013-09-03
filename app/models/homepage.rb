class Homepage < ActiveRecord::Base
  include Subdomain
  validate :url_valid?, :subdomain_valid?
  
  def self.render_file(organization_id) 
    p organization_id 
  end
end
