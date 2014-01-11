require_relative '../spec_helper'

describe Backend do
  it 'should respond to basic redis methods' do
    [:get, :set, :del, :info, :keys, :select].each do |method|
      Backend.should respond_to(method)
    end
  end
end