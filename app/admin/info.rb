ActiveAdmin.register Info  do

  permit_params  :title, :content, :category, :pdt_date

  menu label: Setting.infos.tag, :priority => 10 
  config.per_page = 20
  config.sort_order = "pdt_date_desc"

  
  filter :title, :label => Setting.infos.title
  filter :created_at

  index :title=>Setting.infos.tag do
    #selectable_column
    #id_column
    
    column "日期", :pdt_date, :sortable=>:pdt_date do |f|
      f.pdt_date.strftime('%Y-%m-%d')
    end
    column Setting.infos.title, :title

    #column "创建时间", :created_at, :sortable=>:created_at do |f|
    #  f.created_at.strftime('%Y-%m-%d %H:%M:%S')
    #end
    #column "更新时间", :updated_at do |f|
    #  f.updated_at.strftime('%Y-%m-%d %H:%M:%S')
    #end
    actions
  end

  form :title=>Setting.infos.tag do |f|
    f.inputs "" do
      f.date_field :pdt_date, :value => Date.today , :max => Date.today
      f.text_field :title, :placeholder => '请输入文章标题' 
      f.kindeditor :content, :label => Setting.infos.content 
    end
    f.actions
  end

  show :title=>'信息公开' do
    attributes_table do
      row "ID" do
        activity.id
      end
      
      row Setting.infos.category do
        activity.category
      end
      row Setting.infos.title do
        activity.title
      end
      row Setting.infos.content do
        activity.content.html_safe
      end

      row "创建时间" do
        activity.created_at.strftime('%Y-%m-%d %H:%M:%S')
      end
      row "更新时间" do
        activity.updated_at.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end

end
