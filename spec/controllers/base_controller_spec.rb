require 'spec_helper'

describe BaseController do
  before :each do
    @context = double(:context)
    @controller = BaseController.new(context: @context)
  end

  describe 'execute method' do
    it 'should not raise error if the action executed raised RedisNotAvailable' do
      @controller.stub(:action) { raise RedisNotAvailable }
      @controller.should_receive(:redis_not_available)
      expect{ @controller.execute(:action) }.not_to raise_error
    end
  end

  describe 'redis_not_available method' do
    it 'should render redis not available error page' do
      Backend.stub(:host)
      Backend.stub(:port)
      @context.should_receive(:haml).with('errors/redis_not_available'.to_sym, anything)
      @controller.redis_not_available
    end
  end
end