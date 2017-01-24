class UserSerializer < ActiveModel::Serializer
  attributes :full_name, :email, :jwt
end
