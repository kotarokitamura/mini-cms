class OrganizationsController < ApplicationController
  def edit
    @organization = Organization.find(current_user.organization_id)
  end

  def update
    @organization = Organization.find(current_user.organization_id)
    if @organization.update_attributes(params[:organization])
      render_to :template => 'organizations/edit', notice: t('action.updated_message')
    else
      render_to :template => 'organizations/edit' 
    end
  end
end
