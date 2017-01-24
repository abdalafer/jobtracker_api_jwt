require Rails.root.join('lib/strategies/authentication_jwt_strategy')

Warden::Strategies.add(:authentication_jwt_strategy, AuthenticationJwtStrategy)