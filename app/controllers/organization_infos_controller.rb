class OrganizationInfosController < ApplicationController
  def edit 
    @organization = Organization.find(params[:organization_id])
  end
 
  def update
    @organization = Organization.find(params[:organization_id])
    @organization.update_attributes(params[:organization])
    respond_to do |format|
      format.html{redirect_to :action => "edit"}
    end
  end
end
