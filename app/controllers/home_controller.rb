class HomeController < ApplicationController
  layout "application_control"

  def index
    @notices = Notice.limit(10).order("pdt_date DESC")
    @cmpt_cstrs = Report.where(:category => Setting.reports.ctg_cstr_id).limit(10).order("pdt_date DESC")
    @cmpt_servs = Report.where(:category => Setting.reports.ctg_serv_id).limit(10).order("pdt_date DESC")
    @cmpt_knows = Report.where(:category => Setting.reports.ctg_know_id).limit(10).order("pdt_date DESC")

    @act_cmpts = Activity.where(:category => Setting.activities.ctg_cmpt_id).limit(10).order("pdt_date DESC")
    @act_orgs = Activity.where(:category => Setting.activities.ctg_org_id).limit(8).order("pdt_date DESC")
    @act_bases = Activity.where(:category => Setting.activities.ctg_base_id).limit(8).order("pdt_date DESC")
    @act_mebs = Activity.where(:category => Setting.activities.ctg_meb_id).limit(8).order("pdt_date DESC")

    @results = Result.all

    @carousels = Carousel.all

    @showrooms = Showroom.all
  end
end
