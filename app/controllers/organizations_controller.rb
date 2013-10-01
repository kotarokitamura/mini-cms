class OrganizationsController < ApplicationController
  def show
    @organization = Organization.find(current_user.organization_id)
  end

  def edit
    @organization = Organization.find(current_user.organization_id)
  end

  def update
    @organization = Organization.find(current_user.organization_id)
    if @organization.update_attributes(params[:organization])
      redirect_to action: 'show', notice: t('updated_message')
    else
      render action: "edit"
    end
  end
end
