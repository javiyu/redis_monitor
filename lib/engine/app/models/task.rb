class Task < ActiveRecord::Base
  ACTIVE = 'active'.freeze
  INACTIVE = 'inactive'.freeze
  DEFAULT_INTERVAL = 60
  DEFAULT_DATABASE = 0

  store :data
  after_initialize :init

  def init
    self.every ||= DEFAULT_INTERVAL
    self.database ||= DEFAULT_DATABASE
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

  def reset_queue
    BackgroundTaskJob.new(self).reset_queue
  end

  def backend
    BackendConnection.build(current_database: self.database)
  end
end
