class ManagesController < ApplicationController
  layout "application_control"

  def index
    @manages = Manage.all
  end

  def show
    @manages = Manage.all
    @manage = Manage.find(params[:id])
  end

end

