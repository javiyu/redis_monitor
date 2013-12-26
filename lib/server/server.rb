require 'sinatra'
require 'haml'
require 'modules/router'

module RedisMonitor
  class Server < Sinatra::Base
    include RedisMonitor::Router
    include RedisMonitor::Helpers::LayoutsHelper

    set :public_folder, File.dirname(__FILE__) + '/../static'
    set :views, File.dirname(__FILE__) + '/../views'

    def self.config(arguments)
      set :server, arguments[:http_server]
      set :port, arguments[:http_port]
    end

  end
end

