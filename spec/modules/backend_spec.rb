require 'spec_helper'

describe Backend do
  before :each do
    Backend.stub(:host)
    Backend.stub(:port)
  end

  describe 'ensure_connected method' do
    it 'should raise RedisNotAvailable if redis throws an exception' do
      redis = double(:redis)
      redis.stub(:ping){ raise Redis::CannotConnectError }
      expect{ Backend.ensure_connected(redis) }.to raise_error RedisNotAvailable
    end
  end

  describe 'redis method' do
    it 'should call to ensure_connected' do
      Backend.should_receive(:ensure_connected)
      Backend.redis
    end
  end
end