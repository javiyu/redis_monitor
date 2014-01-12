class BackendConnection
  cattr_accessor :host, :port, :current_database

  def self.setup
    yield(self) if block_given?
  end

  def self.build(opts = {})
    Backend.new(opts.merge(host: host, port: port))
  end
end
