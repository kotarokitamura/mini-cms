class Users::RegistrationsController < Devise::RegistrationsController
  def index
    @members = Member.find(:all, :conditions => {:organization_id => params[:id]})
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

  def next_new_user
    @user = User.new
  end

  def create_next_new_user
    @user = User.new(params[:user])
    @user.members.build(:organization_id => params[:id]) 
    if @user.save
      flash[:notice] = t('action.created_message')
      redirect_to :action => 'index'
    else
      flash[:notice] = t('action.failed_create_message')
      redirect_to :action => 'next_new_user'
    end
  end
end
