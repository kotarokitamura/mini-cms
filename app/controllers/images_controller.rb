class ImagesController < ApplicationController
  def edit
    @organization = Organization.find(current_user.members.first.organization_id)
  end

  def update
    @organization = Organization.find(current_user.members.first.organization_id)
    if @organization.update_attributes(params[:organization])
      render :action => 'edit', :notice => t('action.updated_message')
    else
      render :action => 'edit', :notice => t('action.failed_update_message')
    end
  end
end
