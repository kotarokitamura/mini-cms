module Subdomain
  def self.included(base)
    base.extend ClassMethods
  end
 
  module ClassMethods
    def get_organization_id_by_subdomain(url)
      organization_code = get_organization_code(url)
      get_organization_id(organization_code)      
    end

    def get_organization_code(url)
      #get after "://"
      url =~ /:\/\//
      #get before ".kitasang.com"
      $'=~ /\./
      $` 
    end

    def get_organization_id(organization_code)
      Organization.find_by_organization_code(organization_code).id
    end
  end
end
