require 'active_support/core_ext/hash/indifferent_access'

class WatchQueryTask < Task
  def type_name
    'Watch query'
  end

  def perform
    result = SearchKeys.new(backend, trigger).result.map(&:with_indifferent_access)
    if data[:initialized]
      notify(data[:old_value], result) if data[:old_value] != result
    else
      data[:initialized] = true
    end

    data[:old_value] = result
    save
  end

  def notify(old_value, new_value)
    msg = "Value of key '#{trigger}' has changed from #{old_value.inspect} to #{new_value.inspect}"
    Notification.create!(reporter: name, message: msg)
  end
end