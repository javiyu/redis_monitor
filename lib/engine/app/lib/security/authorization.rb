class Authorization
  DEFAULTS = {remove_content: true}

  def self.config(opts = {})
    opts = {} unless opts
    @@permissions = DEFAULTS.merge(opts)
  end

  def self.permissions
    @@permissions
  end

  def self.authorized_for?(action)
    !!permissions[action]
  end
end

Authorization.config