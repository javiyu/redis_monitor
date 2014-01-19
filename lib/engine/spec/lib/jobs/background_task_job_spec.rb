require_relative '../../spec_helper'

describe BackgroundTaskJob do
  let(:task){ double(id: 1, every: 60) }
  let(:job){ BackgroundTaskJob.new(task) }

  it 'should respond to perform' do
    job.should respond_to(:perform)
  end

  describe 'queue_name' do
    it 'should include task id' do
      job.queue_name.should include(task.id.to_s)
    end
  end

  describe 'add_to_queue' do
    it 'should enqueue job if task is active' do
      task.stub(:active?){ true }
      Delayed::Job.should_receive(:enqueue)
      job.add_to_queue
    end

    it 'should not enqueue job if task is not active' do
      task.stub(:active?){ false }
      Delayed::Job.should_not_receive(:enqueue)
      job.add_to_queue
    end
  end

  describe 'reset_queue' do
    before :each do
      job.stub(:clear_queue)
      job.stub(:add_to_queue)
    end

    it 'should call clear_queue' do
      job.should_receive(:clear_queue)
      job.reset_queue
    end

    it 'should call add_to_queue' do
      job.should_receive(:add_to_queue)
      job.reset_queue
    end
  end

  describe 'after' do
    it 'should call add_to_queue' do
      job.stub(:refresh_data){ task }
      job.should_receive(:add_to_queue)
      job.after(job)
    end
  end
end
