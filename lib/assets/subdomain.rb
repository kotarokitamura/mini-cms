module Subdomain
  DOMAIN = "kitasang.com"
  def self.included(base)
    base.extend ClassMethods
  end
 
  module ClassMethods
    def get_organization_id_by_subdomain(url)
      if url_valid?(url)
        subdomain = get_organization_code(url)
        if subdomain_valid?(subdomain)
           get_organization_id(subdomain)      
        else 
        end
      else 
      end
    end

    def get_organization_code(url)
      url =~ /:\/\//     #get after "://"
      $'=~ /\.#{DOMAIN}/ #get before ".kitasang.com"
      $` 
    end
   
    def get_organization_id(organization_code)
      Organization.find_by_organization_code(organization_code).id
    end
 
    def url_valid?(url)
      url.scan(/#{DOMAIN}/).size == 1  
    end

    def subdomain_valid?(subdomain)
      subdomain =~ /^[0-9a-z]+$/
    end
 
  end
end
