require_relative '../spec_helper'

describe ContentController do
  before :each do
    request.env['HTTP_REFERER'] = '/'
  end

  describe 'search action' do
    it 'should search on backend' do
      Backend.should_receive(:search){ [] }
      get :search
    end
  end

  describe 'delete action' do
    it 'should call remove on Backend' do
      Backend.should_receive(:remove)
      post :delete
    end
  end

  describe 'change_database' do
    it 'should call set_database' do
      controller.should_receive(:set_database)
      post :change_database
    end
  end
end