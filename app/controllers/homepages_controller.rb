class HomepagesController < ApplicationController
 def show 
   @organization = Organization.find(params[:id])
   @organization_infos = @organization.organization_infos
   @stores = @organization.stores
   render :template => "homepages/show2"
 end
end
