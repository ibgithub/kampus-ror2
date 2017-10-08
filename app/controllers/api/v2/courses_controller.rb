class Api::V2::CoursesController < Api::ApplicationController
  include ExceptionHandler
  
  def index
    json_response({message: "Hello V2"})
  end
  
  
end