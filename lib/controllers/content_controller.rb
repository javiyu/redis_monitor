
module RedisMonitor
  module Controllers
    class ContentController < BaseController
      SECTION = 'content'

      def index
        haml 'content/index'.to_sym, layout: main_layout, locals: {section: SECTION}
      end

      def search
        results = Backend.search(params[:key]).paginate(:page => params[:page], :per_page => 20)
        haml 'content/search'.to_sym, layout: main_layout, locals: {results: results, section: SECTION, object: self}
      end

      def delete
        Backend.del(params[:key])
        redirect_back
      end

      def change_database
        set_database(params[:database])
        redirect_back
      end

      private
      def redirect_back
        if http_referer
          context.redirect http_referer
        else
          redirect '/content/search'
        end
      end

    end
  end
end
