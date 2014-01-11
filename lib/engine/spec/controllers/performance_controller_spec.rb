require_relative '../spec_helper'

describe PerformanceController do
  describe 'check action' do
    it 'should get performance stats from backend' do
      Backend.should_receive(:performance_stats)
      get :check
    end
  end
end