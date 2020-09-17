class EstablishmentSerializer < ActiveModel::Serializer
  attributes :id, :place_id, :reviews

  has_many :reviews
end
