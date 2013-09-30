class OrganizationsController < ApplicationController
  def show
    @organization = Organization.where(id: params[:id]).first
  end

  def edit
    @organization = Organization.where(id: params[:id]).first
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
