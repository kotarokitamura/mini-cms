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
     render_file = Homepage.render_file(organization_id) 
     #render :template => "homepages/show2"
     render :template => "homepages/#{render_file}"
   end
 end
end
