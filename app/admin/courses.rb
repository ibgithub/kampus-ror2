ActiveAdmin.register Course do
  permit_params :title, :description, :price, :status, :image
  
  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end
  
  index do
    selectable_column
    column :title do |course|
      link_to course.title, admin_course_path(course)
    end  
    column :price do |course|
      number_to_currency(course.price)
    end  
    column :status
    column :number_of_tasks do |course|
      course.tasks.length
    end
  end
  
  show do
    attributes_table do
      row :title
      row :description do
        raw course.description
      end
      row :price do
        number_to_currency(course.price)
      end
      row :status
      row :image do
        course.image.present? ? image_tag(course.image.url, height: 300) : content_tag(:span, 'No image')
      end
    end
    
    panel "Tasks" do
      table_for resource.tasks do
        handle_column
        column :title
        column :description do |task|
          truncate task.description
        end
        column :video_url
      end
    end
  end
  
  form do |f|
    f.inputs do
      f.input :title
      f.input :description, as: :html_editor
      f.input :price
      f.input :status, as: :select, collection: ["Active", "Not Active"], include_blank: false 
      f.input :image, hint: course.image.present? ? image_tag(course.image.url, height: 300) : content_tag(:span, 'No image')
    end
    f.actions
  end

end
