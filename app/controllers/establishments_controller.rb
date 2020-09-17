class EstablishmentsController < ApplicationController

  def show
    establishment = Establishment.find_by(place_id: params[:id])
    render json: establishment
  end
end