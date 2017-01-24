class AuthenticationJwtStrategy < ::Warden::Strategies::Base
  def valid?
    #request.headers['Authorization'].present?
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