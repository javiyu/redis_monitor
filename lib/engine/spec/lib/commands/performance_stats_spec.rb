require_relative '../../spec_helper'

describe PerformanceStats do
  let(:backend){ double(get: nil, set: nil, del: nil) }
  let(:performance_stats){ PerformanceStats.new(backend) }
  let(:key){ 'key' }

  before :each do
    performance_stats.stub(:generate_key){ key }
  end

  describe 'average_access' do
    it 'should return the average time spent in the test' do
      performance_stats.average_access.should be_kind_of(Float)
    end

    it 'should remove the key created' do
      backend.should_receive(:del).with(key)
      performance_stats.average_access
    end
  end

  describe 'average_write' do
    it 'should return the average time spent in the test' do
      performance_stats.average_write.should be_kind_of(Float)
    end

    it 'should remove the key created' do
      backend.should_receive(:del).with(key)
      performance_stats.average_write
    end
  end

  describe 'average_create_and_delete' do
    it 'should return the average time spent in the test' do
      performance_stats.average_create_and_delete.should be_kind_of(Float)
    end

    it 'should remove the key created' do
      backend.should_receive(:del).with(key)
      performance_stats.average_create_and_delete
    end
  end

  describe 'result' do
    before :each do
      performance_stats.stub(:average_access)
      performance_stats.stub(:average_write)
      performance_stats.stub(:average_create_and_delete)
    end

    it 'should include performance stats' do
      performance_stats.result.should include(:average_access)
      performance_stats.result.should include(:average_write)
      performance_stats.result.should include(:average_create_and_delete)
    end
  end
end