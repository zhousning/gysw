ActiveAdmin.register Showroom  do

  permit_params :photo, :file

  menu label: Setting.showrooms.label, :priority => 2 
  config.per_page = 20
  config.sort_order = "id_asc"

  
  index :title=>Setting.showrooms.label do |f|
    #selectable_column
    #id_column
    
    column Setting.showrooms.title, :title
    column Setting.showrooms.photo, :photo do |c| 
      image_tag(c.photo)
    end

    actions
  end

  form :html => {:multipart => true } do |f|
    f.inputs "详情" do
      f.input :title, :label => Setting.showrooms.title
      f.label '请上传png或jpg图片，图片尺寸长和宽一致，大小小于500K  ' 
      f.file_field :file, :accept => "image/png,image/jpeg"
    end
    f.actions
  end

  show :title=>'企业展厅' do
    attributes_table do
      row "ID" do
        showroom.id
      end
      
      row Setting.showrooms.title do
        showroom.title
      end
      row Setting.showrooms.photo do
        image_tag(showroom.photo)
      end
    end
  end

end
