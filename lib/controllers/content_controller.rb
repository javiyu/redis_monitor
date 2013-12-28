
module RedisMonitor
  module Controllers
    class ContentController < BaseController
      include RedisMonitor::Helpers::LayoutsHelper

      SECTION = 'content'

      def index(params = {})
        haml 'content/index'.to_sym, layout: main_layout, locals: {section: SECTION}
      end

      def search(params = {})
        results = Backend.search(params[:key])
        haml 'content/search'.to_sym, layout: main_layout, locals: {results: results, section: SECTION}
      end
    end
  end
end
