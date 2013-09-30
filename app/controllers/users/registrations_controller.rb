class Users::RegistrationsController < Devise::RegistrationsController
  def new
    @organization = Organization.new
    @organization.users.build
  end

  def create
    @organization = Organization.new(params[:organization])
    ResourceProperty.organization_max_item.times{
      @organization.stores.build
      @organization.products.build
      @organization.organization_infos.build
    }
    @organization.view_designs.build
    @organization.images.build
    if @organization.save
      redirect_to @organization
    else
      render action: "new"
    end
  end
end
