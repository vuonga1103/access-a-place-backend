class User < ApplicationRecord
  has_many :reviews
  has_many :establishments, through: :reviews

  has_secure_password
  validates :email, uniqueness: { case_sensitive: false }
end
