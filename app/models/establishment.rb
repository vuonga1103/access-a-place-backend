class Establishment < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  def find_average(type_rating) # takes in string of rating type
    sum = self.reviews
          .map { |r| r[type_rating] }
          .reduce { |sum, r| r ? sum + r : sum } # avoid adding nil ratings
    total = self.reviews.filter { |r| r[type_rating] }.count

    (sum * 1.0 / total).round(1)
  end

  def average_entrance
    find_average('entrance_rating')
  end

  def average_bathroom
    find_average('bathroom_rating')
  end

  def average_interior
    find_average('interior_rating')
  end

  def average_parking
    find_average('parking_rating')
  end
end
