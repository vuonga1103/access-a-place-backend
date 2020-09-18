class EstablishmentSerializer < ActiveModel::Serializer
  attributes :id, :place_id, :name, :average_overall, :average_entrance, :average_bathroom, :average_interior, :average_parking, :reviews

  has_many :reviews
end
