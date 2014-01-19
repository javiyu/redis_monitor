class WatchKeyTask < Task
  def type_name
    'Watch key'
  end

  def perform
    result = RetrieveKey.new(backend, trigger).result
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
    Notification.create(reporter: name, message: msg)
  end
end