require_relative '../spec_helper'

describe Backend do
  let(:backend){ BackendConnection.build }

  it 'should respond to basic redis methods' do
    [:get, :set, :del, :info, :keys, :select].each do |method|
      backend.should respond_to(method)
    end
  end
end