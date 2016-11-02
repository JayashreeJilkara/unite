class ReviewsController < ApplicationController
  def create
    institute = Institute.find(params[:institute_id])

    if institute.reviews.where(user_id: current_user.id).count == 0
      institute.reviews << Review.new(review_params.merge(user_id: current_user.id))
    else
      flash[:error] = 'You have already reviewed this institute.'
    end

    redirect_to :back
  end

  private

  def review_params
    params.require(:review).permit(:review_comment, :rating)
  end
end
