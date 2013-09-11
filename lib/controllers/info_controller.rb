
module RedisMonitor
  module Controllers
    class InfoController < BaseController
      include RedisMonitor::Helpers::LayoutsHelper

      def index
        haml 'info/info'.to_sym, layout: main_layout, locals: {info: Backend.info}
      end
    end
  end
end
