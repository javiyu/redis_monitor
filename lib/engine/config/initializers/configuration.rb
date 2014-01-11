if defined?(REDIS_MONITOR_OPTS)
  Backend.config(redis_host: REDIS_MONITOR_OPTS[:redis_host], redis_port: REDIS_MONITOR_OPTS[:redis_port])
  Authorization.config(REDIS_MONITOR_OPTS[:permissions])
  Authentication.config(REDIS_MONITOR_OPTS[:credentials])
end
