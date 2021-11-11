class ReportsController < ApplicationController
  layout "application_control"

  def index
    @reports = Report.all.order("pdt_date DESC").page( params[:page]).per( Setting.systems.per_page ) 
  end

  def show
    @report = Report.find(params[:id])
  end

  def cstr 
    @reports = Report.where(:category => Setting.reports.ctg_cstr_id).order("pdt_date DESC").page( params[:page]).per( Setting.systems.per_page ) 
  end
  
  def serv 
    @reports = Report.where(:category => Setting.reports.ctg_serv_id).order("pdt_date DESC").page( params[:page]).per( Setting.systems.per_page ) 
  end

  def know 
    @reports = Report.where(:category => Setting.reports.ctg_know_id).order("pdt_date DESC").page( params[:page]).per( Setting.systems.per_page ) 
  end
end

