class HomepagesController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:show]
  def preview
    @organization = Organization.find(current_user.organization_id)
    render :template => "homepages/show#{@organization.view_designs.first.design_number}.html.haml", :layout => false
  end

  def show
    organization_id = Homepage.get_organization_id_by_subdomain(request.url) or InvalidUrlError
    @organization = Organization.find(organization_id)
    render :template => "homepages/show#{@organization.view_designs.first.design_number}.html.haml", :layout => false
  end
end
