class ReviewsController < ApplicationController
  before_action :authorized, only: [:create]
  
  def create
    review = @user.reviews.build(review_params)
    establishment = Establishment.find_by(place_id: params[:place_id])
    review.establishment = establishment
    review.save

    render json: establishment
  end

  private

  def review_params
    params.require(:review).permit(:bathroom_rating, :entrance_rating, :interior_rating, :parking_rating, :content)
  end
end
