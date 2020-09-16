class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :entrance_rating, :bathroom_rating, :parking_rating, :interior_rating, :content

  belongs_to :user
  belongs_to :establishment
end
