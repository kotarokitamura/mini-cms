class OrganizationInfosController < ApplicationController
  def edit
    @organization = Organization.find(current_user.members.first.organization_id)
  end

  def update
    @organization = Organization.find(current_user.members.first.organization_id)
    if @organization.update_attributes(params[:organization])
      flash[:notice] = t('action.updated_message')
      render :action => 'edit'
    else
      flash[:notice] = t('action.failed_update_message')
      render :action => 'edit'
    end
  end
end
