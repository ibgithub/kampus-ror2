require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  test "should get show" do
    get course_task_url(courses(:one), tasks(:one))
    assert_response :redirect
  end

  test "should be able to access preview task" do
    sign_in(users(:user_one))
    get course_task_url(courses(:two), tasks(:two))
    assert_response :success
  end
end
