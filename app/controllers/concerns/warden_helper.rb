module WardenHelper
  extend ActiveSupport::Concern

  included do
    helper_method :warden, :signed_in?, :current_user
  end

  def signed_in?
    current_user.present?
  end

  def current_user
    warden.user
  end

  def warden
    request.env['warden']
  end

  def authenticate!
    warden.authenticate!
  end
end