ActiveAdmin.register Task do
  permit_params :course_id, :title, :description, :video_url, :image, :preview, :position

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end
  
  member_action :sort, method: :post do
    resource.set_list_position(params[:position])
  end
  
  member_action :move_to_top, method: :post do
    resource.move_to_top
    redirect_to admin_course_path(resource.course), notice: "#{resource.title} task moved to top."
  end
  
  # show do
  #   attributes_table do
  #     row :course_id
  #     row :title
  #     row :description do
  #       raw resource.description
  #     end
  #     row :video_url
  #     row :image
  #     row :preview
  #     row :position
  #   end
  # end
  
  # form do |f|
  #   f.inputs do
  #     f.input :course_id, as: :select, collection: resource.tasks, include_blank: false # selected: selected_country_id
  #     f.input :title
  #     f.input :description, as: :html_editor
  #     f.input :video_url
  #     f.input :image, hint: resource.image.present? ? image_tag(resource.image.url, height: 300) : content_tag(:span, 'No image')
  #     f.input :preview
  #     f.input :position
  #   end
  #   f.actions
  # end
end
