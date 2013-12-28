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

  describe 'search' do
    let(:keys){ ['k1', 'k2', 'k3'] }

    before :each do
      Backend.stub(:keys){ keys }
      Backend.stub(:get){ 'value' }
    end

    it 'should return an array of hashes' do
      Backend.search('*').should be_kind_of(Array)
      Backend.search('*')[0].should be_kind_of(Hash)
    end

    it 'every entry should have key and value data' do
      Backend.search('*')[0][:key].should_not be_nil
      Backend.search('*')[0][:value].should_not be_nil
    end
  end
end