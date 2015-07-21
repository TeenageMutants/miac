class OrganizationsController < ApplicationController
  def index
  end
  def info
    @organization = Organization.find(params[:id])

  end
end
