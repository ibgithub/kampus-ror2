class Api::CoursesController < Api::ApplicationController
  include ExceptionHandler
  
  def index
    @courses = Course.all
    json_response(@courses)
  end
  
  def show
    @course = Course.find(params[:id])
    json_response(@course)
  end
end