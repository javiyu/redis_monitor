require_relative '../../spec_helper'

describe Authorization do
  describe 'authorized_for?' do
    it 'should return true if the permission exists and its value is true' do
      Authorization.stub(:permissions){ {action: true} }
      Authorization.authorized_for?(:action).should == true
    end

    it 'should return false if the permission does not exists or its value is false' do
      Authorization.stub(:permissions){ {action: false} }
      Authorization.authorized_for?(:action).should == false
      Authorization.authorized_for?(:action2).should == false
    end

  end
end