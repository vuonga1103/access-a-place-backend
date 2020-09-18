class EstablishmentsController < ApplicationController

  def show
    if establishment = Establishment.find_by(place_id: params[:id])
      render json: establishment
    else
      render json: { error: "That establishment does not exist in the database"}
    end
  end

  def get_rating_and_review_count
    # If any establishment sent in front Yelp API exists and has a review in the database, return that establishment with key/value of review_count and average_overall; otherwise just return the establishment object untouched
    updated_establishments = params[:businesses].map do |est|
      
      if Establishment.has_reviews?(est['id'])
        db_est = Establishment.find_by(place_id: est['id'])
        est['review_count'] = db_est.reviews.count
        est['average_overall'] = db_est.average_overall
      end
      est
    end

    render json: updated_establishments
  end
end