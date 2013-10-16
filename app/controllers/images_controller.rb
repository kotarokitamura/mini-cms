class ImagesController < ApplicationController
  def edit
    @organization = Organization.find(get_organization_id_by_current_user)
  end

  def update
    @organization = Organization.find(get_organization_id_by_current_user)
    if @organization.update_attributes(params[:organization])
      render :action => 'edit', :notice => t('action.updated_message')
    else
      render :action => 'edit', :notice => t('action.failed_update_message')
    end
  end
end
