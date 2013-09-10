require 'redis'

module RedisMonitor
  class Backend
    def self.config(arguments)
      @@host = arguments[:redis_host]
      @@port = arguments[:redis_port]
    end

    def self.redis
      Redis.new(:host => @@host, :port => @@port)
    end

    def self.info
      redis.info
    end
  end
end