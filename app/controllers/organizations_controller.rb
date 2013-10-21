class OrganizationsController < ApplicationController
  def edit
    @organization = Organization.find(params[:id])
    raise ForbiddenError unless @organization.access_filter?(current_user)
  end

  def update
    @organization = Organization.find(params[:id])
    if @organization.update_attributes(params[:organization])
      flash[:notice] = t('action.updated_message')
      render :action => 'edit'
    else
      flash[:notice] = t('action._failed_updated_message')
      render :action => 'edit'
   end
  end
end
