module RedisMonitor
  module Helpers
    module LayoutsHelper
      def main_layout
        'layouts/main'.to_sym
      end

      def selected_section(section, selected)
        'active' if section == selected
      end

      def content_menu(selected_section)
        capture_haml do
          haml_tag :ul, class: 'nav navbar-nav' do
            haml_tag :li, class: selected_section('info', selected_section) do
              haml_tag :a, 'Info', href: '/info'
            end
            haml_tag :li, class: selected_section('performance', selected_section) do
              haml_tag :a, 'Performance', href: '/performance'
            end
          end
        end
      end

    end
  end
end
