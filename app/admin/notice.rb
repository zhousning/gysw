ActiveAdmin.register Notice  do

  permit_params  :title, :content, :pdt_date

  menu label: Setting.notices.tag, :priority => 9 
  config.per_page = 20
  config.sort_order = "pdt_date_desc"

  
  filter :title, :label => Setting.notices.title
  filter :created_at

  index :title=>Setting.notices.tag do
    #selectable_column
    #id_column
    
    column "日期", :pdt_date, :sortable=>:pdt_date do |f|
      f.pdt_date.strftime('%Y-%m-%d')
    end
    column Setting.notices.title, :title

    #column "创建时间", :created_at, :sortable=>:created_at do |f|
    #  f.created_at.strftime('%Y-%m-%d %H:%M:%S')
    #end
    #column "更新时间", :updated_at do |f|
    #  f.updated_at.strftime('%Y-%m-%d %H:%M:%S')
    #end
    actions
  end

  form do |f|
    f.inputs "" do
      
      f.date_field :pdt_date, :max => Date.today
      f.text_field :title, :placeholder => '请输入标题' 
      f.kindeditor :content, :label => Setting.notices.content 
    end
    f.actions
  end

  show :title=>Setting.notices.tag do
    attributes_table do
      row "ID" do
        notice.id
      end
      
      row Setting.notices.title do
        notice.title
      end
      row Setting.notices.content do
        notice.content.html_safe
      end

      row "创建时间" do
        notice.created_at.strftime('%Y-%m-%d %H:%M:%S')
      end
      row "更新时间" do
        notice.updated_at.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end

end
