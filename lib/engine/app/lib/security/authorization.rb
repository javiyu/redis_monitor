class Authorization
  DEFAULTS = {remove_content: true}

  def self.setup(opts = {})
    opts = {} unless opts
    @@permissions = DEFAULTS.merge(opts)
  end

  def self.permissions
    @@permissions
  end

  def self.authorized_for?(action)
    !!permissions[action]
  end

  def self.execute_if_authorized_for(action)
    yield if authorized_for?(action) && block_given?
  end
end