require 'spec_helper'

describe BaseController do
  let(:context){ double() }
  let(:controller){ BaseController.new(context: context) }

  before :each do
    Backend.stub(:host)
    Backend.stub(:port)
  end

  describe 'execute method' do
    it 'should not raise error if the action executed raised RedisNotAvailable' do
      controller.stub(:action) { raise RedisNotAvailable }
      controller.should_receive(:redis_not_available)
      expect{ controller.execute(:action) }.not_to raise_error
    end
  end

  describe 'redis_not_available method' do
    it 'should render redis not available error page' do
      context.should_receive(:haml).with('errors/redis_not_available'.to_sym, anything)
      controller.redis_not_available
    end
  end

  describe 'set_database' do
    it 'should change the actual database' do
      controller.stub(:session){ {} }
      Backend.should_receive(:change_database)
      controller.set_database(2)
    end
  end
end