class EstablishmentsController < ApplicationController

  def show
    if establishment = Establishment.find_by(place_id: params[:id])
      render json: establishment
    else
      render json: { error: "That establishment does not exist in the database"}
    end

  end
end