require 'redis'
require 'errors/errors'
require 'modules/performance_stats'
require 'forwardable'

module RedisMonitor
  class Backend
    extend SingleForwardable

    def_delegators :redis, :get, :set, :info, :keys, :dbsize, :monitor

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

    def self.redis
      @@redis ||= Redis.new(:host => host, :port => port)
    end

    def self.performance_stats
      PerformanceStats.new(self).results
    end

    def self.search(key)
      keys(key).map{|found| {key: found, value: get(found)} }
    end

    def self.del(key)
      redis.del(key) if Authorization.authorized_for?(:remove_content)
    end
  end
end