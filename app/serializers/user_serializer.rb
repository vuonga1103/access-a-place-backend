class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name
  
  has_many :reviews
  has_many :establishments, through: :reviews

end
