class BookmarkSerializer < ActiveModel::Serializer
  attributes :id, :user, :establishment

  def user
    user = object.user
    {
      id: user.id,
      email: user.email,
      first_name: user.first_name,
      last_name: user.last_name,
      image_url: user.image_url,
      date_joined: user.date_joined
    }
  end

  def establishment
    est = object.establishment
    {
      id: est.id,
      place_id: est.place_id,
      alias: est.alias,
      name: est.name,
      image_url: est.image_url,
      is_closed: est.is_closed,
      phone: est.phone,
      categories: est.categories,
      location: est.location,
      coordinates: est.coordinates,
      photos: est.photos,
      hours: est.hours
    }
  end
end
