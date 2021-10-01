class ActivitiesController < ApplicationController
  layout "application_control"

  def index
    @activities = Activity.all.order("pdt_date DESC").page( params[:page]).per( Setting.systems.per_page ) 
  end

  def show
    @activity = Activity.find(params[:id])
  end

  
end

