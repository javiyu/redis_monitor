require_relative '../spec_helper'

describe InfoController do
  let(:backend){ BackendConnection.build }

  describe 'index action' do
    it 'should get info from backend' do
      controller.stub(:backend){ backend }
      backend.should_receive(:info)
      get :index
    end
  end
end