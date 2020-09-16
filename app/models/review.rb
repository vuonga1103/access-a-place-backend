class Review < ApplicationRecord
  belongs_to :user
  belongs_to :establishment

  def average_rating
    ratings = [self.entrance_rating, self.bathroom_rating, self.parking_rating, self.interior_rating]
    ratings.sum(0.0) / ratings.size
  end
end
