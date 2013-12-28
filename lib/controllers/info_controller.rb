
module RedisMonitor
  module Controllers
    class InfoController < BaseController
      include RedisMonitor::Helpers::LayoutsHelper

      SECTION = 'info'

      def index(params={})
        haml 'info/info'.to_sym, layout: main_layout, locals: {info: Backend.info, section: SECTION}
      end
    end
  end
end
