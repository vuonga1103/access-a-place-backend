class RatingChangeReviews < ActiveRecord::Migration[6.0]
  def change
    change_column(:reviews, :entrance_rating, :float)
    change_column(:reviews, :bathroom_rating, :float)
    change_column(:reviews, :parking_rating, :float)
    change_column(:reviews, :interior_rating, :float)
  end
end
