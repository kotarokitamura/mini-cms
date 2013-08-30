class HomepagesController < ApplicationController
 def preview 
   @organization = Organization.find(params[:id])
   @organization_infos = @organization.organization_infos
   @stores = @organization.stores
   render :template => "homepages/show2"
 end
  
 def show 
   #@organization = Organization.find(params[:id])
   @organization = Organization.find(1)
   @organization_infos = @organization.organization_infos
   @stores = @organization.stores
   render :template => "homepages/show2"
 end
end
