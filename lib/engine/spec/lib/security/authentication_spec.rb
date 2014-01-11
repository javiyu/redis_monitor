require_relative '../../spec_helper'

describe Authentication do
  let(:server){ double(class_eval: nil, use: nil) }
  let(:credentials){ {user: 'user', password: 'password'} }

  describe 'config' do
    it 'should inject authentication in server class' do
      Authentication.should_receive(:inject_authentication)
      Authentication.config(server, credentials)
    end
  end

  describe 'inject_authentication' do
    before :each do
      Authentication.config(server, credentials)
      server.stub(:class_eval){|&block| block.call }
    end

    it 'should include authentication if required' do
      Authentication.stub(:authentication_required?){ true }
      Authentication.should_receive(:use).with(Rack::Auth::Basic, anything)
      Authentication.inject_authentication
    end

    it 'should not include authentication if not required' do
      Authentication.stub(:authentication_required?){ false }
      Authentication.should_not_receive(:use)
      Authentication.inject_authentication
    end
  end

  describe 'authentication_required??' do
    before :each do
      Authentication.stub(:inject_authentication)
    end

    it 'should return true if it has some credentials' do
      Authentication.config(server, credentials)
      Authentication.authentication_required?.should eq(true)
    end

    it 'should return false if no credentials were provided' do
      Authentication.config(server, nil)
      Authentication.authentication_required?.should eq(false)
    end
  end
end