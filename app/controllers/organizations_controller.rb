class OrganizationsController < ApplicationController
  def edit
    @organization = Organization.find(current_user.organization_id)
  end

  def update
    @organization = Organization.find(current_user.organization_id)
    if @organization.update_attributes(params[:organization])
      render :action => 'edit', notice: t('action.updated_message')
    else
      render :action => 'edit', notice: t('action._failed_updated_message')
    end
  end
end
