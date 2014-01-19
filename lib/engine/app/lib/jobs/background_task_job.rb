class BackgroundTaskJob < Struct.new(:task)
  def queue_name
    "task_#{task.id}"
  end

  def run_at
    task.every.seconds.from_now
  end

  def clear_queue
    Delayed::Job.where(queue: queue_name).destroy_all
  end

  def add_to_queue
    if task.active?
      Delayed::Job.enqueue(self, queue: queue_name, run_at: run_at)
    end
  end

  def reset_queue
    clear_queue
    add_to_queue
  end

  def perform
    task.perform
  end

  def refresh_data
    self.task = Task.where(id: task.id).first
  end

  def after(job)
    refresh_data
    add_to_queue if task
  end

  def self.reset_all_queues
    Delayed::Job.where("queue like 'task_%'").destroy_all
    Task.all.each{|task| new(task).add_to_queue}
  end
end
