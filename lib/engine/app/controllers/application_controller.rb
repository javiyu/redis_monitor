class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  if Authentication.authentication_required?
    http_basic_authenticate_with name: Authentication.credentials[:user], password: Authentication.credentials[:password]
  end

  def backend
    @backend ||= BackendConnection.build(current_database: session[:database])
  end
end
