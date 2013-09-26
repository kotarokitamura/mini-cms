class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.all
  end

  def show
    @organization = Organization.where(id: params[:id]).first
  end

  def new
    @organization = Organization.new
  end

  def edit
    @organization = Organization.where(id: params[:id]).first
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
      redirect_to @organization, notice: t('created_message')
    else
      render action: "new" 
    end
  end

  def update
    @organization = Organization.where(id: params[:id]).first
    if @organization.update_attributes(params[:organization])
      redirect_to @organization, notice: t('updated_message')
    else
      render action: "edit"
    end
  end

  def destroy
    @organization = Organization.where(id: params[:id]).first
    @organization.destroy
    redirect_to organizations_url
  end
end
