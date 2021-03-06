module ApplicationHelper
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
        section(name: 'info', title: 'Info', url: info_index_path, selected_section: selected_section)
        section(name: 'content', title: 'Content', url: content_index_path, selected_section: selected_section)
        section(name: 'tasks', title: 'Tasks', url: tasks_path, selected_section: selected_section)
        section(name: 'notifications', title: 'Notifications', url: notifications_path, selected_section: selected_section)
        section(name: 'performance', title: 'Performance', url: performance_index_path, selected_section: selected_section)
      end
    end
  end

  def remove_class
    'btn btn-danger'
  end

  def edit_class
    'btn btn-primary'
  end

  def redis_configuration_string
    "#{backend.host}:#{backend.port}"
  end
end
