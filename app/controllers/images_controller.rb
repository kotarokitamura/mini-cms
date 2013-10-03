class ImagesController < ApplicationController
  def edit
    @organization = Organization.find(current_user.organization_id)
  end

  def update
    @organization = Organization.find(current_user.organization_id)
    @organization.update_attributes(params[:organization])
    render :template => 'images/edit', :notice => t('updated_message')
  end
end
