ActiveAdmin.register Report  do

  permit_params  :title, :content, :category, :pdt_date

  menu label: Setting.reports.tag, :priority => 7 
  config.per_page = 20
  config.sort_order = "id_asc"

  
  filter :title, :label => Setting.reports.title
  filter :created_at

  index :title=>Setting.reports.tag do
    selectable_column
    id_column
    
    column Setting.reports.title, :title

    column "创建时间", :created_at, :sortable=>:created_at do |f|
      f.created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    column "更新时间", :updated_at do |f|
      f.updated_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    actions
  end

  form do |f|
    f.inputs "" do
      
      f.input :category, :as => :select, :collection => [ [Setting.reports.ctg_cstr, Setting.reports.ctg_cstr_id], [Setting.reports.ctg_serv, Setting.reports.ctg_serv_id], [Setting.reports.ctg_know, Setting.reports.ctg_know_id]], :label => Setting.reports.category, :include_blank => false
      f.date_field :pdt_date, :value => Date.today
      f.text_field :title, :placeholder => '请输入文章标题' 
      f.kindeditor :content, :label => Setting.reports.content
    end
    f.actions
  end

  show :title=>Setting.reports.tag do
    attributes_table do
      row "ID" do
        report.id
      end
      row Setting.reports.category do
        report.category
      end
      
      row Setting.reports.title do
        report.title
      end
      row Setting.reports.content do
        report.content.html_safe
      end

      row "创建时间" do
        report.created_at.strftime('%Y-%m-%d %H:%M:%S')
      end
      row "更新时间" do
        report.updated_at.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end

end
