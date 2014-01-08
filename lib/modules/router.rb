require 'modules/helpers'
require 'modules/controllers'

module RedisMonitor
  module Router
    include RedisMonitor::Controllers

    def dependencies
      {context: self, session: session, params: params}
    end

    def self.included(server)
      server.get('/'){ redirect '/info' }
      server.get('/info'){ InfoController.new(dependencies).execute(:index) }

      server.get('/content'){ ContentController.new(dependencies).execute(:index) }
      server.get('/content/search'){ ContentController.new(dependencies).execute(:search) }
      server.post('/content/delete'){ ContentController.new(dependencies).execute(:delete) }
      server.post('/content/change_database'){ ContentController.new(dependencies).execute(:change_database) }

      server.get('/performance'){ redirect '/performance/warning' }
      server.get('/performance/warning'){ PerformanceController.new(dependencies).execute(:warning) }
      server.get('/performance/check'){ PerformanceController.new(dependencies).execute(:check) }
    end
  end
end
