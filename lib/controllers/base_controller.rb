require 'modules/backend'
require 'errors/errors'

module RedisMonitor
  module Controllers
    class BaseController
      attr_accessor :context, :params

      include RedisMonitor::Helpers::BaseHelper
      include RedisMonitor::Helpers::LayoutsHelper

      def initialize(opts = {})
        @context = opts.delete(:context)
        @params = opts
      end

      def execute(action, params = {})
        begin
          send(action, params)
        rescue RedisMonitor::Errors::RedisNotAvailable
          redis_not_available
        end
      end

      def redis_not_available
        haml 'errors/redis_not_available'.to_sym, layout: main_layout,
                     locals: {host: Backend.host, port: Backend.port}
      end
    end
  end
end
