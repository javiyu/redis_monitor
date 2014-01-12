require_relative '../spec_helper'

describe ContentController do
  let(:backend){ double() }
  before :each do
    request.env['HTTP_REFERER'] = '/'
    controller.stub(:backend){ backend }
    controller.stub(:load_database_list)
    controller.stub(:load_current_database)
  end

  describe 'search action' do
    it 'should search on backend' do
      SearchKey.any_instance.should_receive(:result){ [] }
      get :search
    end
  end

  describe 'delete action' do
    it 'should call remove on Backend' do
      RemoveKey.any_instance.should_receive(:execute)
      post :delete
    end
  end

  describe 'change_database' do
    it 'should call set_database' do
      ChangeDatabase.any_instance.should_receive(:execute)
      post :change_database
    end
  end
end