class Users::RegistrationsController < Devise::RegistrationsController
  def index
    @organization = Organization.find(params[:id])
    raise ForbiddenError unless @organization.access_filter?(current_user) && User.admin_user?(current_user)
  end

  def next_new_user
    @user = User.new
    raise ForbiddenError unless Organization.access_filter?(params[:id],current_user) && User.admin_user?(current_user)
  end

  def create_next_new_user
    @organization = Organization.find(params[:id])
    raise ForbiddenError unless @organization.access_filter?(current_user) && User.admin_user?(current_user)
    @organization.users.build(params[:user])
    if @organization.save
      flash[:notice] = t('action.created_message')
      redirect_to :action => 'index'
    else
      flash[:notice] = t('action.failed_create_message')
      redirect_to :action => 'next_new_user'
    end
  end

  def new
    @organization = Organization.new
    @organization.users.build
  end

  def create
    @organization = Organization.new(params[:organization])
    if @organization.first_create
      redirect_to new_user_session_path
    else
      flash[:notice] = t('action.failed_create_message')
      render action: 'new'
    end
  end
end
