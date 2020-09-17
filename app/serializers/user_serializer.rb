class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :reviews
  
  has_many :reviews
end
