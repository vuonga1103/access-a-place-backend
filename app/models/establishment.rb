class Establishment < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  has_many :bookmarks
  has_many :users, through: :bookmarks

  validates :place_id, uniqueness: true

  serialize :categories, Array
  serialize :location, Array
  serialize :coordinates, Hash
  serialize :photos, Array
  serialize :hours, Array

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

  def average_overall
    sum_all_averages = [self.average_entrance, self.average_bathroom, self.average_interior, self.average_parking].sum

    (sum_all_averages * 1.0 / 4).round(1)
  end

  private

  def find_average(type_rating) # takes in string of rating type
    sum = self.reviews
          .map { |r| r[type_rating] }
          .reduce { |sum, r| r ? sum + r : sum } # avoid adding nil ratings
    total = self.reviews.filter { |r| r[type_rating] }.count

    return 0 if !sum 

    (sum * 1.0 / total).round(1)
  end
end
