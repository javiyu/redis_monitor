require 'sinatra'
require 'haml'
require 'modules/router'
require 'modules/security/authorization'
require 'will_paginate/view_helpers/sinatra'
require 'will_paginate-bootstrap'

module RedisMonitor
  class Server < Sinatra::Base
    include RedisMonitor::Router
    include RedisMonitor::Helpers::LayoutsHelper
    include WillPaginate::Sinatra::Helpers
    include RedisMonitor::Helpers::PaginationHelper
    include RedisMonitor::Helpers::DatabaseHelper

    set :public_folder, File.dirname(__FILE__) + '/../static'
    set :views, File.dirname(__FILE__) + '/../views'
    enable :sessions

    def self.config(arguments)
      set :server, arguments[:http_server]
      set :port, arguments[:http_port]
    end

  end
end

