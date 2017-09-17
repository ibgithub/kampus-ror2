require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  test "should not be able to post review if not signed in" do
    post course_reviews_path(courses(:one), reviews(:one)), params: {review: {star: 1, comment: "test"}}
    assert_response :redirect
    assert_equal flash[:alert], "Access Denied"
  end
  
  test "should be able to post review if signed in and has subscribes the course" do
    sign_in(users(:user_one))
    post course_reviews_path(courses(:one), reviews(:one)), params: {review: {star: 5, comment: "test", course_id: courses(:one).id, user_id: users(:user_one).id} }
    assert_redirected_to course_path(courses(:one))
    assert_nil flash[:alert], "Access Denied"
  end
  
  test "should be able to delete review if signed in and has subscribes the course" do
    user = users(:user_one)
    course = courses(:one)
    sign_in(user)
    # delete course_reviews_path(course, reviews(:one))
    # assert_redirected_to course_path(course)
    # assert_nil flash[:alert]
  end
  
  test "should not be able to delete review if signed in and not has subscribes the course" do
    user = users(:user_two)
    course = courses(:one)
    sign_in(user)
    # delete course_reviews_path(course, reviews(:one))
    # assert_response :redirect
    # assert_equal flash[:alert], "Access Denied"
  end
end
