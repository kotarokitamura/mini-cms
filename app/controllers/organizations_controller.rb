class OrganizationsController < ApplicationController
  def edit
    @organization = Organization.find(current_user.organization_id)
  end

  def update
    @organization = Organization.find(current_user.organization_id)
    if @organization.update_attributes(params[:organization])
      flash[:notice] = t('action.updated_message')
      render :action => 'edit'
    else
      flash[:notice] = t('action._failed_updated_message')
      render :action => 'edit'
   end
  end
end
