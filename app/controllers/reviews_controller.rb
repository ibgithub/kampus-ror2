class ReviewsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  def create
    @review = current_user.reviews.new(review_params)
    @course = Course.friendly.find(params[:course_id])
    @review.course = @course
    if @review.save
      redirect_to @course, notice: "Review successfully submitted"
    end
  end
  
  def destroy
    @review.destroy
    redirect_to @review.course, notice: "Review successfully removed"
  end
  
  def review_params
    params.require(:review).permit(:star, :comment, :user_id, :course_id)
  end
end
