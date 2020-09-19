class EstablishmentsController < ApplicationController

  def show
    if establishment = Establishment.find_by(place_id: params[:id])
      render json: establishment
    else
      render json: { error: "That establishment does not exist in the database"}
    end
  end

  def yelp
    api_key = ENV['YELP_API']

    bearer_token = "Bearer " + api_key
    
    @response = HTTParty.get("https://api.yelp.com/v3/businesses/search?#{params[:query]}", :headers => {
      "Content_Type": "application/json",
      "Authorization": bearer_token
    }).body

    render json: @response
  end
end