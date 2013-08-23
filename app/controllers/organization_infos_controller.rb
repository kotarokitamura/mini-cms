class OrganizationInfosController < ApplicationController
  def show 
    @organization = Organization.find(params[:organization_id])
  end

  def new
    @organization = Organization.new
    @organization.stores.build
    @organization.organization_infos.build
  end
  
  def create
    organization_info_update
  end

  def edit 
    @organization = Organization.find(params[:organization_id])
  end
 
  def update
    organization_info_update
  end

  private
    def organization_info_update
      @organization = Organization.find(params[:organization_id])
      @organization.update_attributes(params[:organization])
      redirect_to :action => "show",notice: 'Organization was successfully updated'
    end
end
