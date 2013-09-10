require 'modules/helpers'
require 'modules/controllers'

module RedisMonitor
  module Router
    include RedisMonitor::Controllers

    def self.included(server)
      server.get('/'){ redirect '/info' }
      server.get('/info'){ InfoController.new(context: self).index }
    end
  end
end
