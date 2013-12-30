require 'spec_helper'

describe PerformanceController do
  let(:context){ double() }
  let(:controller){ PerformanceController.new(context: context) }

  describe 'warning action' do
    it 'should render warning template' do
      context.should_receive(:haml).with('performance/warning'.to_sym, anything)
      controller.warning
    end
  end

  describe 'check action' do
    it 'should render check template' do
      Backend.stub(:performance_stats){ {} }
      context.should_receive(:haml).with('performance/check'.to_sym, anything)
      controller.check
    end
  end
end