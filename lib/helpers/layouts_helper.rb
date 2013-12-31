module RedisMonitor
  module Helpers
    module LayoutsHelper
      def main_layout
        'layouts/main'.to_sym
      end

      def selected_is_selected(section, selected)
        'active' if section == selected
      end

      def section(opts = {})
        haml_tag :li, class: selected_is_selected(opts[:name], opts[:selected_section]) do
          haml_tag :a, opts[:title], href: opts[:url]
        end
      end

      def content_menu(selected_section)
        capture_haml do
          haml_tag :ul, class: 'nav navbar-nav' do
            section(name: 'info', title: 'Info', url: '/info', selected_section: selected_section)
            section(name: 'content', title: 'Content', url: '/content', selected_section: selected_section)
            section(name: 'performance', title: 'Performance', url: '/performance', selected_section: selected_section)
          end
        end
      end

      def authorized_for?(action)
        Authorization.authorized_for?(action)
      end
    end
  end
end
