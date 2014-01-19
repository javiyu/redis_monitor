require_relative '../spec_helper'

describe Task do
  let(:task){ Task.new }

  it 'should respond to active?' do
    task.should respond_to(:active?)
  end

  it 'should respond to reset_queue' do
    task.should respond_to(:reset_queue)
  end

  it 'should respond to backend' do
    task.should respond_to(:backend)
  end

  it 'should use default values after initialization' do
    Task.new.every.should == Task::DEFAULT_INTERVAL
    Task.new.database.should == Task::DEFAULT_DATABASE
  end

end