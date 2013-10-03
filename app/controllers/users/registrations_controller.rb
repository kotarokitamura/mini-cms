class Users::RegistrationsController < Devise::RegistrationsController
  def index
    @users = User.find_all_by_organization_id(current_user.organization_id)
  end

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
      redirect_to new_user_session_path
    else
      render action: 'new', :notice => t('failed_create_message')
    end
  end

  def next_new_user
    @user = User.new
  end

  def create_next_new_user
    @user = User.new(params[:user])
    @user.organization_id = current_user.organization_id 
    if @user.save
      redirect_to :action => 'index', :notice => t('created_message')
    else
      redirect_to :action => 'next_new_user', :notice => t('failed_create_mesage')
    end
  end
end
