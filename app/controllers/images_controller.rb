class ImagesController < ApplicationController
  def edit
    @organization = Organization.find(paramas[:origanization_id])
  end

  def update
    @organization = Organization.find(params[:organization_id])
    @organization.update_atttributes(params[:organization])
    redirect_to ({:action => 'edit'}), :notice => t('updated_message')
  end
end
