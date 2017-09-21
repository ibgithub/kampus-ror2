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
  
  test "should be able to complete task and redirect to next task" do
    sign_in(users(:user_one))
    course = courses(:one)
    put complete_course_task_path(course, tasks(:one))
    assert_redirected_to course_task_path(course, tasks(:three))    
    put complete_course_task_path(course, tasks(:three))
    assert_redirected_to course_path(course)
  end
end
