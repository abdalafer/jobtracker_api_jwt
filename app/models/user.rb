class User < ApplicationRecord
  after_create :generate_jwt_token
  has_many :customers
  attr_accessor :jwt
  has_secure_password

  def generate_jwt_token
    self.jwt = JWTWrapper.encode(self.slice(:id, :email))
  end
end
