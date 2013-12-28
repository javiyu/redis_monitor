require 'modules/helpers'
require 'modules/controllers'

module RedisMonitor
  module Router
    include RedisMonitor::Controllers

    def self.included(server)
      server.get('/'){ redirect '/info' }
      server.get('/info'){ InfoController.new(context: self).execute(:index, params) }

      server.get('/content'){ ContentController.new(context: self).execute(:index, params) }
      server.get('/content/search'){ ContentController.new(context: self).execute(:search, params) }
      server.post('/content/delete'){ ContentController.new(context: self).execute(:delete, params) }

      server.get('/performance'){ redirect '/performance/warning' }
      server.get('/performance/warning'){ PerformanceController.new(context: self).execute(:warning, params) }
      server.get('/performance/check'){ PerformanceController.new(context: self).execute(:check, params) }
    end
  end
end
