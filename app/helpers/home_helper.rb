module HomeHelper

  def activity_ctg 
    hash = {}
    hash[Setting.activities.ctg_cmpt_id] = Setting.activities.ctg_cmpt
    hash[Setting.activities.ctg_org_id]  = Setting.activities.ctg_org
    hash[Setting.activities.ctg_base_id] = Setting.activities.ctg_base
    hash[Setting.activities.ctg_meb_id]  = Setting.activities.ctg_meb
    hash
  end

  def report_ctg 
    hash = {}
    hash[Setting.reports.ctg_cstr_id] = Setting.reports.ctg_cstr
    hash[Setting.reports.ctg_serv_id]  = Setting.reports.ctg_serv
    hash[Setting.reports.ctg_know_id] = Setting.reports.ctg_know
    hash
  end
end
