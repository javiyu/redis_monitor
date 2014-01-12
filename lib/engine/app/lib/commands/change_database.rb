class ChangeDatabase < Struct.new(:backend, :session, :database)
  def execute
    backend.current_database = database
    session[:database] = database
  end
end