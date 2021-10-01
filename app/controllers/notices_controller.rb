class NoticesController < ApplicationController
  layout "application_control"

  def index
    @notices = Notice.all.order("pdt_date DESC").page( params[:page]).per( Setting.systems.per_page ) 
  end

  def show
    @notice = Notice.find(params[:id])
  end

end

