class EstablishmentsController < ApplicationController

  def index
    render json: Establishment.all, include: "reviews,reviews.user"
  end
end