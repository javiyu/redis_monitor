
module RedisMonitor
  module Controllers
    class PerformanceController < BaseController
      include RedisMonitor::Helpers::LayoutsHelper

      SECTION = 'performance'

      def warning(params = {})
        haml 'performance/warning'.to_sym, layout: main_layout, locals: {section: SECTION}
      end

      def check(params = {})
        stats = Backend.performance_stats
        haml 'performance/check'.to_sym, layout: main_layout, locals: {stats: stats, section: SECTION}
      end

    end
  end
end
