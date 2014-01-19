require_relative '../spec_helper'

describe TasksController do
  let(:id){ 777 }
  let(:task){ double() }
  let(:task_params){ {name: 'task'} }

  before :each do
    controller.stub(:load_section)
    controller.stub(:task_params){ task_params }
    controller.stub(:reset_queue)
    Task.stub(:find){ task }
  end

  describe 'index action' do
    it 'should assigns tasks' do
      get :index
      assigns[:tasks].should_not be_nil
    end

    it 'should render template index' do
      get :index
      controller.should render_template('index')
    end
  end

  describe 'new action' do
    it 'should assigns task' do
      get :new
      assigns[:task].should_not be_nil
    end

    it 'should render template new' do
      get :new
      controller.should render_template('new')
    end
  end

  describe 'edit action' do
    it 'should assigns task' do
      get :edit, id: id
      assigns[:task].should_not be_nil
    end

    it 'should render template edit' do
      get :edit, id: id
      controller.should render_template('edit')
    end
  end

  describe 'create action' do
    it 'should assigns task' do
      post :create
      assigns[:task].should_not be_nil
    end

    it 'should save task' do
      post :create
      assigns[:task].should be_persisted
    end

    it 'should redirect to action index' do
      post :create
      controller.should redirect_to(action: :index)
    end
  end

  describe 'update action' do
    before :each do
      task.stub(:update_attributes)
    end

    it 'should assigns task' do
      put :update, id: id
      assigns[:task].should_not be_nil
    end

    it 'should update task' do
      task.should_receive(:update_attributes)
      put :update, id: id
    end

    it 'should redirect to action index' do
      put :update, id: id
      controller.should redirect_to(action: :index)
    end
  end

  describe 'destroy action' do
    before :each do
      task.stub(:destroy)
    end

    it 'should assigns task' do
      delete :destroy, id: id
      assigns[:task].should_not be_nil
    end

    it 'should call destroy on the task' do
      task.should_receive(:destroy)
      delete :destroy, id: id
    end

    it 'should redirect to action index' do
      delete :destroy, id: id
      controller.should redirect_to(action: :index)
    end
  end
end