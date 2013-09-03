class HomepagesController < ApplicationController
 def preview 
   @organization = Organization.find(params[:id])
   @organization_infos = @organization.organization_infos
   @stores = @organization.stores
   render :template => "homepages/show"
 end
  
 def show 
   organization_id = Homepage.get_organization_id_by_subdomain(request.url)
   if organization_id.nil? 
     render :file => "#{Rails.root}/public/404.html"
   else
     @organization = Organization.find(organization_id)
     render :template => "homepages/show#{@organization.view_designs.first.design_number}.html.erb"
   end
 end
end
