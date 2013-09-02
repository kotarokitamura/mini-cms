class HomepagesController < ApplicationController
 def preview 
   @organization = Organization.find(params[:id])
   @organization_infos = @organization.organization_infos
   @stores = @organization.stores
   render :template => "homepages/show"
 end
  
 def show 
   organization_id = Homepage.get_organization_id_by_subdomain(request.url)
   @organization = Organization.find(organization_id)
   render :template => "homepages/show2"
 end
end
