require_relative '../spec_helper'

describe WatchKeyTask do
  let(:task){ WatchKeyTask.new }

  it 'should respond to type_name' do
    task.should respond_to(:type_name)
  end

  it 'should respond to perform' do
    task.should respond_to(:perform)
  end
end