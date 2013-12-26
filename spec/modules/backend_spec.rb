require 'spec_helper'

describe Backend do
  before :each do
    Backend.stub(:host)
    Backend.stub(:port)
    Redis.stub(:new){ double(:redis) }
  end

  describe 'redis' do
    it 'create only one connection' do
      Redis.should_receive(:new).once
      Backend.redis
      Backend.redis
    end
  end

  describe 'performance_stats' do
    before :each do
      PerformanceStats.any_instance.stub(:results){ {} }
    end

    it 'should return a hash with the stats' do
      Backend.performance_stats.should be_kind_of(Hash)
    end
  end
end