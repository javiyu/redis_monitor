require 'redis'
require 'errors/errors'

module RedisMonitor
  class Backend
    def self.config(arguments)
      @@host = arguments[:redis_host]
      @@port = arguments[:redis_port]
    end

    def self.host
      @@host
    end

    def self.port
      @@port
    end

    def self.ensure_connected(redis)
      begin
        redis.ping
      rescue Redis::CannotConnectError => e
        raise RedisMonitor::Errors::RedisNotAvailable
      end
    end

    def self.redis
      redis = Redis.new(:host => @@host, :port => @@port)
      ensure_connected(redis)
      redis
    end

    def self.info
      redis.info
    end
  end
end