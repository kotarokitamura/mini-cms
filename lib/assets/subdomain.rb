module Subdomain
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def get_organization_id_by_subdomain(url)
      return nil unless url_valid?(url)
      subdomain = get_organization_code(url)
      return nil unless subdomain_valid?(subdomain)
      get_organization_id(subdomain)
    end

    def get_organization_code(url)
      url =~ /:\/\//
      $'=~ /\.#{ResourceProperty.domain}/
      $`
    end

    def get_organization_id(organization_code)
      Organization.find_by_organization_code(organization_code).id
    end

    def url_valid?(url)
      url.scan(/#{ResourceProperty.domain}/).size == 1
    end

    def subdomain_valid?(subdomain)
      subdomain =~ /^[0-9a-z]+$/
    end
  end
end
