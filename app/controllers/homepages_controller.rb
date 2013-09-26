class HomepagesController < ApplicationController
 def preview
   @organization = Organization.where(id: params[:id]).first
   @organization_infos = @organization.organization_infos
   @stores = @organization.stores
   render :template => "homepages/show"
 end

 def show
   organization_id = Homepage.get_organization_id_by_subdomain(request.url) or InvalidUrlError
   @organization = Organization.where(id: organization_id).first
   render :template => "homepages/show#{@organization.view_designs.first.design_number}.html.haml"
 end

end
