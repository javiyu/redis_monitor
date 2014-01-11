require_relative '../spec_helper'

describe InfoController do
  describe 'index action' do
    it 'should get info from backend' do
      Backend.should_receive(:info)
      get :index
    end
  end
end