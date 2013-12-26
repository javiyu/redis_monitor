
module RedisMonitor
  module Controllers
    class PerformanceController < BaseController
      include RedisMonitor::Helpers::LayoutsHelper

      def warning
        haml 'performance/warning'.to_sym, layout: main_layout, locals: {section: 'performance'}
      end

      def check
        stats = Backend.performance_stats
        haml 'performance/check'.to_sym, layout: main_layout, locals: {stats: stats, section: 'performance'}
      end

    end
  end
end
