require 'modules/helpers'
require 'modules/controllers'

module RedisMonitor
  module Router
    include RedisMonitor::Controllers

    def self.included(server)
      server.get('/'){ redirect '/info' }
      server.get('/info'){ InfoController.new(context: self).execute(:index) }

      server.get('/performance'){ redirect '/performance/warning' }
      server.get('/performance/warning'){ PerformanceController.new(context: self).execute(:warning) }
      server.get('/performance/check'){ PerformanceController.new(context: self).execute(:check) }
    end
  end
end
