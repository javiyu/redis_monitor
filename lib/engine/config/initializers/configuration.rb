if defined?(REDIS_MONITOR_OPTS)
  BackendConnection.setup do |config|
    config.host = REDIS_MONITOR_OPTS[:redis_host]
    config.port = REDIS_MONITOR_OPTS[:redis_port]
  end
  Authorization.setup(REDIS_MONITOR_OPTS[:permissions])
  Authentication.setup(REDIS_MONITOR_OPTS[:credentials])
end
