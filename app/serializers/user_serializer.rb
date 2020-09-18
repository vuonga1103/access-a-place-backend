class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :reviews

  def reviews
    object.reviews.map do |review|
      {
        id: review.id,
        place_name: review.establishment.name,
        place_id: review.establishment.place_id,
        entrance_rating: review.entrance_rating,
        bathroom_rating: review.bathroom_rating,
        parking_rating: review. parking_rating,
        interior_rating: review.interior_rating,
        content: review.content,
        date: review.date
      }
    end
  end
end
