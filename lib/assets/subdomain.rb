module Subdomain
  DOMAIN = "kitasang.com"
  def self.included(base)
    base.extend ClassMethods
  end
 
  module ClassMethods
    def get_organization_id_by_subdomain(url)
      if url_valid?(url)
        subdomain = get_organization_code(url)
        return subdomain_valid?(subdomain) ? get_organization_id(subdomain) : nil
      else 
        return nil
      end
    end

    def get_organization_code(url) 
      url =~ /:\/\//     
      $'=~ /\.#{DOMAIN}/ 
      return $` 
    end
   
    def get_organization_id(organization_code)
      return Organization.find_by_organization_code(organization_code).id
    end
 
    def url_valid?(url)
      return url.scan(/#{DOMAIN}/).size == 1  
    end

    def subdomain_valid?(subdomain)
      return subdomain =~ /^[0-9a-z]+$/
    end
  end
end
