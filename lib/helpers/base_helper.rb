module RedisMonitor
  module Helpers
    module BaseHelper
      def haml(*arguments)
        context.haml(*arguments)
      end
    end
  end
end