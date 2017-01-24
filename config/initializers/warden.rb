class AuthenticationJwtStrategy < ::Warden::Strategies::Base
  def valid?
    env['HTTP_AUTHORIZATION'].present?
  end

  def authenticate!
    return fail! unless claims
    return fail! unless claims.has_key?('id')
    success! User.find_by_id(claims['id'])
  end

  protected

  def claims
    strategy, token = env['HTTP_AUTHORIZATION'].split(' ')
    return nil if (strategy || '').downcase != 'bearer'
    JWTWrapper.decode(token) rescue nil
  end

end

class AuthenticationPasswordStrategy < ::Warden::Strategies::Base
  def valid?
    params['user'] && params['user']['email'] && params['user']['password']
  end

  def authenticate!
    user = User.where(email: params['user']['email']).first

    return fail! unless user.present?
    if user.authenticate(params['user']['password'])
      user.generate_jwt_token
      return success!(user)
    end

  end
end

Warden::Strategies.add(:authentication_jwt_strategy, AuthenticationJwtStrategy)
Warden::Strategies.add(:authentication_password_strategy, AuthenticationPasswordStrategy)

#Adding Warden to the middle of the stack
Rails.application.config.middleware.insert_after ActionDispatch::Callbacks, Warden::Manager do |manager|
  manager.default_strategies :authentication_jwt_strategy, :authentication_password_strategy
  manager.failure_app = UnauthorizedController
end