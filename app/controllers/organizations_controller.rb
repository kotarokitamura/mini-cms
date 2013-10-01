class OrganizationsController < ApplicationController
  def edit
    @organization = Organization.find(current_user.organization_id)
  end

  def update
    @organization = Organization.find(current_user.organization_id)
    if @organization.update_attributes(params[:organization])
      redirect_to action: 'edit', notice: t('updated_message')
    else
      redirect_to action: 'edit'
    end
  end
end
