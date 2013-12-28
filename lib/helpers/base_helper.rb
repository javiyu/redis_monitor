module RedisMonitor
  module Helpers
    module BaseHelper
      def haml(*arguments)
        context.haml(*arguments)
      end

      def redirect(*arguments)
        context.redirect(*arguments)
      end
    end
  end
end