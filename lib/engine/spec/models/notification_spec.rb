require_relative '../spec_helper'

describe Notification do
  let(:notification){ Notification.new }

  it 'should respond to when' do
    notification.should respond_to(:when)
  end
end