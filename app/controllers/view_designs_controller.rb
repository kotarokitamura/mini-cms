class ViewDesignsController < ApplicationController
  #def edit
  #  @organization = Organization.find(get_organization_id_by_current_user)
  #  raise ForbiddenError unless @organization.access_filter?(current_user)
  #end

  #def update
  #  @organization = Organization.find(get_organization_id_by_current_user)
  #  raise ForbiddenError unless @organization.access_filter?(current_user)
  #  if @organization.update_attributes(params[:organization])
  #    flash[:notice] = t('action.updated_message')
  #    render :action => 'edit'
  #  else
  #    flash[:notice] = t('action.failed_update_message')
  #    render :action => 'edit'
  #  end
  #end
end
