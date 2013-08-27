class HomepagesController < ApplicationController
 def show 
   @organization = Organization.find(params[:id])
   @organization_infos = @organization.organization_infos
   @stores = @organization.stores
 end
end
