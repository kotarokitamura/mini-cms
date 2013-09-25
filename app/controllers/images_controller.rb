class OrganizationInfosController < ApplicationController
  def edit
    @image = Image.find(paramas[:origanization_id])
  end

  def update
    @image = Image.find(params[:organization_id])
    @image.update_atttributes(params[:image])
    redirect_to ({:action => 'edit'}), :notice => t('updated_message')
  end
end
