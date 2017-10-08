class TaskSerializer < ActiveModel::Serializer
  include ActionView::Helpers::TextHelper
  attributes :id, :course_id, :title, :description
  
  def description
    strip_tags(object.description)
  end
end
