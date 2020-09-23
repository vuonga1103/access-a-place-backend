class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :date, :entrance_rating, :bathroom_rating, :parking_rating, :interior_rating, :content, :user

  def user
    user = object.user
    {
      id: user.id,
      email: user.email,
      first_name: user.first_name,
      last_name: user.last_name,
      image_url: user.image_url
    }
  end
end
