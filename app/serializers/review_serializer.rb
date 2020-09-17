class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :entrance_rating, :bathroom_rating, :parking_rating, :interior_rating, :content, :establishment, :user

  belongs_to :establishment, serializer: EstablishmentSerializer
  belongs_to :user, serializer: UserSerializer
end
