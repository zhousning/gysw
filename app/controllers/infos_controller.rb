class InfosController < ApplicationController
  layout "application_control"

  def index
    @infos = Info.all.order("pdt_date DESC").page( params[:page]).per( Setting.systems.per_page ) 
  end

  def show
    @info = Info.find(params[:id])
  end

  
end

