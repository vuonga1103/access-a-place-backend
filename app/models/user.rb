class User < ApplicationRecord
  has_many :reviews
  has_many :establishments, through: :reviews
  has_many :bookmarks
  has_many :establishments, through: :bookmarks

  has_secure_password
  validates :email, uniqueness: { case_sensitive: false }

  def date_joined
    self.created_at.to_date.strftime("%m/%d/%Y")
  end
end
