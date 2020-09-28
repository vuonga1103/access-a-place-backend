class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :image_url, :date_joined, :reviews

  def reviews
    object.reviews.map do |review|
      {
        id: review.id,
        user_id: review.user.id,
        place_name: review.establishment.name,
        place_alias: review.establishment.alias,
        place_id: review.establishment.place_id,
        image_url: review.establishment.image_url,
        entrance_rating: review.entrance_rating,
        bathroom_rating: review.bathroom_rating,
        parking_rating: review.parking_rating,
        interior_rating: review.interior_rating,
        content: review.content,
        date: review.date
      }
    end
  end
end
