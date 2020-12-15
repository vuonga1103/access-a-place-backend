class EstablishmentsController < ApplicationController
  @@headers = {
    :headers => { 
      "Content_Type": "application/json",
      "Authorization": "Bearer " + ENV['YELP_API']
    }
  }

  def yelp_establishments

    response = JSON.parse(HTTParty.get("https://api.yelp.com/v3/businesses/search?#{params[:query]}", @@headers).body)
    
    if response['error']
      render json: { error: "No Results Found"}
    else
      establishments = response['businesses'].map do |api_est|
        db_est = Establishment.find_by(place_id: api_est['id'])
        db_est ? db_est : create_db_est_from_api_est(api_est)
      end
      
      render json: establishments
    end
  end

  def yelp_establishment
    api_est = JSON.parse(HTTParty.get("https://api.yelp.com/v3/businesses/#{params[:slug]}", @@headers).body)

    if api_est['error']
      render json: { error: "No Results Found"}
    else
      db_est = Establishment.find_by(place_id: api_est['id'])
      db_est = create_db_est_from_api_est(api_est) if !db_est
      db_est.update(photos: api_est['photos'], hours: api_est['hours'])
      render json: db_est
    end
  end

  private

  def create_db_est_from_api_est(api_est)
    api_est['image_url'] = "https://tacm.com/wp-content/uploads/2018/01/no-image-available.jpeg" if api_est['image_url'].length == 0

    Establishment.create({
      place_id: api_est['id'],
      alias: api_est['alias'],
      name: api_est['name'],
      image_url: api_est['image_url'],
      is_closed: api_est['is_closed'],
      phone: api_est['display_phone'],
      categories: api_est['categories'].map { |c| c['title'] },
      location: api_est['location']['display_address'],
      coordinates: api_est['coordinates'],
    })
  end
end