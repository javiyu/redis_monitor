require 'redis'
require 'errors/errors'
require 'modules/performance_stats'
require 'forwardable'

module RedisMonitor
  class Backend
    extend SingleForwardable

    def_delegators :redis, :get, :set, :info, :keys, :dbsize, :select

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

    def self.change_database(*args)
      select(*args)
    end

    def self.del(key)
      redis.del(key) if Authorization.authorized_for?(:remove_content)
    end

    def self.databases
      info.keys.map{|d| d.match(/db(\d+)/);$1}.compact
    end
  end
end