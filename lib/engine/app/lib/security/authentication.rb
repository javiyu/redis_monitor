module Authentication

  def self.config(credentials)
    @@credentials = credentials
  end

  def self.authentication_required?
    !!credentials
  end

  def self.credentials
    @@credentials
  end
end