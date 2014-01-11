module Authentication

  def self.config(server, credentials)
    @@credentials = credentials
    @@server = server
    inject_authentication
  end

  def self.inject_authentication
    if authentication_required?
      @@server.class_eval do
        use Rack::Auth::Basic, 'Restricted Area' do |username, password|
          username == Authentication.credentials[:user] and password == Authentication.credentials[:password]
        end
      end
    end
  end


  def self.authentication_required?
    !!credentials
  end

  def self.credentials
    @@credentials
  end
end