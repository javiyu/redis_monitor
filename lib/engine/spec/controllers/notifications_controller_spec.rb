require_relative '../spec_helper'

describe NotificationsController do
  before :each do
    controller.stub(:load_section)
  end

  describe 'index action' do
    it 'should assigns notifications' do
      get :index
      assigns[:notifications].should_not be_nil
    end

    it 'should render template index' do
      get :index
      controller.should render_template('index')
    end
  end

  describe 'destroy action' do
    let(:id){ 33}
    let(:notification){ double() }

    before :each do
      Notification.stub(:find){ notification }
      notification.stub(:destroy)
    end

    it 'should call destroy on the notification' do
      notification.should_receive(:destroy)
      delete :destroy, id: id
    end

    it 'should redirect to action index' do
      delete :destroy, id: id
      controller.should redirect_to(action: :index)
    end
  end
end