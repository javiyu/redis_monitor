require 'redis'
require 'forwardable'

class Backend
  extend SingleForwardable
  cattr_accessor :host, :port, :current_database

  def_delegators :redis, :get, :set, :info, :keys, :select, :del

  def self.setup
    yield(self) if block_given?
  end

  def self.redis
    @@redis ||= Redis.new(host: host, port: port)
  end
end
