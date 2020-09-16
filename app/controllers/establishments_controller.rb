class EstablishmentsController < ApplicationController

  def index
    establishments = Establishment.all
    render json: establishments, include: "reviews,reviews.user"
  end
end