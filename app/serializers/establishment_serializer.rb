class EstablishmentSerializer < ActiveModel::Serializer
  attributes :id, :place_id

  has_many :reviews
  has_many :users, through: :reviews
end
