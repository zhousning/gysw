ActiveAdmin.register Carousel  do

  permit_params :photo, :file

  menu label: Setting.carousels.label, :priority => 2 
  config.per_page = 20
  config.sort_order = "id_asc"

  
  index :title=>Setting.carousels.label do |f|
    #selectable_column
    #id_column
    
    column Setting.carousels.title, :title
    column Setting.carousels.photo, :photo do |c| 
      image_tag(c.photo)
    end

    actions
  end

  form :html => {:multipart => true } do |f|
    f.inputs "详情" do
      
      f.input :title, :label => Setting.carousels.title
      f.label '请上传png或jpg图片，图片尺寸770*380像素，大小小于500K  ' 
      f.file_field :file, :accept => "image/png,image/jpeg"
    end
    f.actions
  end

  show :title=>'首页轮播图' do
    attributes_table do
      row "ID" do
        carousel.id
      end
      
      row Setting.carousels.title do
        carousel.title
      end
      row Setting.carousels.photo do
        image_tag(carousel.photo)
      end
    end
  end

end
