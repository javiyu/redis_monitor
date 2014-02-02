class Backend
  attr_accessor :host, :port, :current_database

  delegate :get, :set, :info, :keys, :select, :del, :to => :redis

  def initialize(opts = {})
    @host = opts[:host]
    @port = opts[:port]
    @current_database = opts[:current_database]
  end

  def redis
    @redis ||= Redis.new(host: host, port: port)
    @redis.select(current_database)
    @redis
  end
end
