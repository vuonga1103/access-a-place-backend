class EstablishmentsController < ApplicationController

  def show
    if establishment = Establishment.find_by(id: params[:id])
      render json: establishment
    else
      render json: { error: "That establishment does not exist in the database"}
    end
  end

  def yelp
    api_key = ENV['YELP_API']
    bearer_token = "Bearer " + api_key
    
    response = HTTParty.get("https://api.yelp.com/v3/businesses/search?#{params[:query]}", :headers => {
      "Content_Type": "application/json",
      "Authorization": bearer_token
    }).body

    establishments = JSON.parse(response)['businesses'].map do |api_est|
      db_est = Establishment.find_by(place_id: api_est['id'])
      db_est ? db_est : create_new_establishment_from_api(api_est)
    end

    render json: establishments
  end

  private

  def create_new_establishment_from_api(establishment_from_api)
    Establishment.create({
      place_id: establishment_from_api['id'],
      alias: establishment_from_api['alias'],
      name: establishment_from_api['name'],
      image_url: establishment_from_api['image_url'],
      is_closed: establishment_from_api['is_closed'],
      phone: establishment_from_api['display_phone'],
      categories: establishment_from_api['categories'].map { |c| c['title'] },
      location: establishment_from_api['location']['display_address'],
      coordinates: establishment_from_api['coordinates'],
    })
  end
end