require 'modules/helpers'
require 'modules/controllers'

module RedisMonitor
  module Router
    include RedisMonitor::Controllers

    def self.included(server)
      server.get('/'){ redirect '/info' }
      server.get('/info'){ InfoController.new(context: self).execute(:index) }
    end
  end
end
