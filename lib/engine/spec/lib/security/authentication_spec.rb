require_relative '../../spec_helper'

describe Authentication do
  let(:credentials){ {user: 'user', password: 'password'} }

  describe 'config' do
    it 'should inject authentication in server class' do
      Authentication.config(credentials)
    end
  end

  describe 'authentication_required??' do
    it 'should return true if it has some credentials' do
      Authentication.config(credentials)
      Authentication.authentication_required?.should eq(true)
    end

    it 'should return false if no credentials were provided' do
      Authentication.config(nil)
      Authentication.authentication_required?.should eq(false)
    end
  end
end