require 'modules/backend'

module RedisMonitor
  module Controllers
    class BaseController
      attr_accessor :context, :params

      def initialize(opts = {})
        @context = opts.delete(:context)
        @params = opts
      end
    end
  end
end
