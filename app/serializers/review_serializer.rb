class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :entrance_rating, :bathroom_rating, :parking_rating, :interior_rating, :content, :establishment, :user
end
