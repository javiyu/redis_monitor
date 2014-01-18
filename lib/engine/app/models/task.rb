class Task < ActiveRecord::Base
  ACTIVE = 'active'.freeze
  INACTIVE = 'inactive'.freeze
  DEFAULT_INTERVAL = 60

  after_initialize :init

  def init
    self.every ||= DEFAULT_INTERVAL
  end

  def self.selectable_actions
    [['Watch key', WatchKeyTask], ['Watch query', WatchQueryTask]]
  end

  def active?
    status == ACTIVE
  end

  def to_partial_path
    'tasks/task'
  end
end
