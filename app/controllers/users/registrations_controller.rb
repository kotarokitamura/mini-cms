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

  def next_new_user
    @user = User.new(organization_id: params[:organization_id])
  end

  def create_next_new_user
    @user = User.new(params[:user])
    @user.organization_id = params[:organization_id]
    @user.save
    redirect_to :action => "next_new_user"
  end
end
