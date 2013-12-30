
module RedisMonitor
  module Controllers
    class ContentController < BaseController
      include RedisMonitor::Helpers::LayoutsHelper

      SECTION = 'content'

      def index(params = {})
        haml 'content/index'.to_sym, layout: main_layout, locals: {section: SECTION}
      end

      def search(params = {})
        results = Backend.search(params[:key]).paginate(:page => params[:page], :per_page => 20)
        haml 'content/search'.to_sym, layout: main_layout, locals: {results: results, section: SECTION, object: self}
      end

      def delete(params = {})
        Backend.del(params[:key])

        if http_referer
          context.redirect http_referer
        else
          redirect '/content/search'
        end
      end

    end
  end
end
