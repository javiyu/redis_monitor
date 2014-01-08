module RedisMonitor
  module Helpers
    module DatabaseHelper
      def current_database
        session[:database].to_i
      end

      def databases
        Backend.databases.each do |database|
          database_option(database)
        end
      end

      def database_option(database)
        haml_tag :option, {selected: (database.to_i == current_database.to_i)} do
          haml_concat database
        end
      end

      def choose_database_select
        capture_haml do
          haml_tag :form, action: '/content/change_database', method: 'post' do
            haml_tag :div, class: 'form-group' do
              haml_tag :label, for: 'database_select' do
                haml_concat 'Select database'
              end

              haml_tag :select, id: 'database_select', name: 'database', class: 'selectpicker form-control', data: {style: 'btn-info'} do
                databases
              end
            end
          end

        end
      end

    end
  end
end

