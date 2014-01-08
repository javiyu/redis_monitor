module RedisMonitor
  module Helpers
    module PaginationHelper
      def bootstrap_paginate(results)
        will_paginate results, renderer: BootstrapPagination::Sinatra
      end
    end
  end
end

