require 'delayed_job'
Delayed::Worker.backend = :active_record
BackgroundTaskJob.reset_all_queues rescue nil
