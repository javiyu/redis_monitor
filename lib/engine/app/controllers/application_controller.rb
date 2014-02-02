class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from Redis::CannotConnectError, :with => :redis_not_available

  helper_method :backend

  if Authentication.authentication_required?
    http_basic_authenticate_with name: Authentication.credentials[:user], password: Authentication.credentials[:password]
  end

  def backend
    @backend ||= BackendConnection.build(current_database: session[:database])
  end

  def redis_not_available
    render 'layouts/redis_not_available'
  end
end
