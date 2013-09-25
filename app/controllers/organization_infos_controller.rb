class OrganizationInfosController < ApplicationController
  def edit
    @organization = Organization.find(params[:organization_id])
  end

  def update
    @organization = Organization.find(params[:organization_id])
    @organization.update_attributes(params[:organization])
    redirect_to ({:action => 'edit'}), :notice => t('updated_message')
  end
end
