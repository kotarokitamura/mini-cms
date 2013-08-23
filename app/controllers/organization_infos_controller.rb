class OrganizationInfosController < ApplicationController
  def show 
    @organization_info = OrganizationInfo.find(params[:id])
  end

  def new
    @organization = Organization.new
    @organization.stores.build
    @organization.organization_infos.build
  end
  
  def create
    organization_info_update
    redirect_to @organization 
  end

  def edit 
    @organization = Organization.find(params[:organization_id])
  end
 
  def update
    organization_info_update
    redirect_to @organization, notice: 'successfuly update'
  end

  private
    def organization_info_update
      @organization = Organization.find(params[:organization_id])
      @organization.update_attributes(params[:organization])
    end
end
