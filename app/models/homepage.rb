class Homepage < ActiveRecord::Base
  include Subdomain
  validate :url_valid?, :subdomain_valid?
end
