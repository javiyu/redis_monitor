require_relative '../spec_helper'

describe WatchQueryTask do
  let(:task){ WatchQueryTask.new }

  it 'should respond to type_name' do
    task.should respond_to(:type_name)
  end

  it 'should respond to perform' do
    task.should respond_to(:perform)
  end
end