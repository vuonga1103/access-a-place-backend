class EstablishmentSerializer < ActiveModel::Serializer
  attributes :id, :place_id, :reviews

  def reviews
    object.reviews.map do |review|
      # user = review.user.map { |user| { :id => user.id, :email => user.email, :first_name => user.first_name, :last_name => user.last_name } }

      { 
        :id => review.id,
        :entrance_rating => review.entrance_rating,
        :bathroom_rating => review.bathroom_rating,
        :interior_rating => review.interior_rating,
        :content => review.content,
        # :user => user
      }
    end
  end
end
