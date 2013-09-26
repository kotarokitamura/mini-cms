class ViewDesignsController < ApplicationController
  def edit
    @organization = Organization.where(id: params[:organization_id]).first
  end

  def update
    @organization = Organization.where(id: params[:organization_id]).first
    @organization.update_attributes(params[:organization])
    redirect_to ({:action => 'edit'}), :notice => t('updated_message')
  end
end
