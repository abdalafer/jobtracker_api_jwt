class UnauthorizedController < ActionController::Metal
  def self.call(env)
    @response ||= action(:response_ac)
    @response.call(env)
  end

  def response_ac
    self.response_body = "Unauthorized Action"
    self.status = :unauthorized
  end

end