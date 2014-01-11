require_relative '../spec_helper'

describe PerformanceController do
  describe 'check action' do
    it 'should get performance stats from backend' do
      PerformanceStats.any_instance.should_receive(:result)
      get :check
    end
  end
end