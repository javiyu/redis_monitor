require_relative '../spec_helper'

describe Backend do
  let(:redis){ double(del: '') }

  before :each do
    Backend.stub(:host)
    Backend.stub(:port)
    Backend.stub(:redis){ redis }
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

  describe 'del' do
    it 'should not delete content if not allowed' do
      Authorization.stub(:authorized_for?).with(:remove_content){ false }
      redis.should_receive(:del).never
      Backend.remove('key')
    end

    it 'should remove content if allowed' do
      Authorization.stub(:authorized_for?).with(:remove_content){ true }
      redis.should_receive(:del)
      Backend.remove('key')
    end
  end

  describe 'databases' do
    it 'should retrieve databases' do
      info_keys = {db0: '', db1: '', example: ''}
      Backend.stub(:info){ info_keys }
      Backend.databases.should include('0')
      Backend.databases.should include('1')
    end
  end
end