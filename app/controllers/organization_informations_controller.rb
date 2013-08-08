class OrganizationInformationsController < ApplicationController
  def show 
    @stores = Store.find(params[:id])
    @products = Product.find(params[:id])
    @organization_infos = OrganizationInfo.find(params[:id])
  end

  def new
    @store = Store.new
    @product = Product.new
    @organization_infos = OrganizationInfo.new

  end
  
  def create
  end

  def edit 
  end
 
  def update
  end
end
