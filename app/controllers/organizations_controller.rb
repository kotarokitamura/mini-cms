class OrganizationsController < ApplicationController
  def edit
    find_organization
  end

  def update
    find_organization
    update_organization
    render :action => 'edit'
  end

  def edit_organization_infos
    find_organization
    render :template => "organization_infos/edit"
  end

  def update_organization_infos
    find_organization
    update_organization
    render :template => "organization_infos/edit"
  end

  def edit_view_designs
    find_organization
    render :template => "view_designs/edit"
  end

  def update_view_designs
    find_organization
    update_organization
    render :template => "view_designs/edit"
  end

  def preview
    find_organization
    render :template => "homepages/show#{@organization.view_designs.first.design_number}.html.haml", :layout => false
  end

  def edit_images
    find_organization
    render :template => "images/edit"
  end

  def update_images
    find_organization
    update_organization
    render :template => "images/edit"
  end

private
  def find_organization
    @organization = Organization.find(params[:id])
    raise ForbiddenError unless @organization.access_filter?(current_user)
  end

  def update_organization
    flash[:notice] = @organization.update_attributes(params[:organization]) ? t('action.updated_message') : t('action._failed_updated_message')
  end
end
