class HomepagesController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:show]
  def preview
    @organization = Organization.find(params[:id])
    raise ForbiddenError unless @organization.access_filter?(current_user)
    render :template => "homepages/show#{@organization.view_designs.first.design_number}.html.haml", :layout => false
  end

  def show
    organization_id = Homepage.get_organization_id_by_subdomain(request.url) or InvalidUrlError
    if organization_id.nil?
      render :template => 'homepages/top_page', :layout => false
    else 
      @organization = Organization.find(organization_id)
      render :template => "homepages/show#{@organization.view_designs.first.design_number}.html.haml", :layout => false
    end
  end
end
