require 'modules/backend'
require 'errors/errors'

module RedisMonitor
  module Controllers
    class BaseController
      attr_accessor :context, :session, :params

      include RedisMonitor::Helpers::BaseHelper
      include RedisMonitor::Helpers::LayoutsHelper

      def initialize(opts = {})
        @context = opts.delete(:context)
        @session = opts.delete(:session)
        @params = opts.delete(:params)
      end

      def execute(action)
        begin
          send(action)
        rescue RedisMonitor::Errors::RedisNotAvailable
          redis_not_available
        end
      end

      def redis_not_available
        haml 'errors/redis_not_available'.to_sym, layout: main_layout,
                     locals: {host: Backend.host, port: Backend.port}
      end

      def http_referer
        context.env['HTTP_REFERER']
      end

      def context
        @context
      end

      def params
        @params
      end

      def session
        @session
      end

      def set_database(database)
        session[:database] = database
        Backend.change_database(database)
      end
    end
  end
end
