class Authentication
  cattr_accessor :credentials

  def self.setup(credentials)
    @@credentials = credentials
  end

  def self.authentication_required?
    !!credentials
  end
end