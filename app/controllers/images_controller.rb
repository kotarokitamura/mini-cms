class OrganizationInfosController < ApplicationController
  def edit
    @image = Image.find(paramas[:origanization_id])
end
