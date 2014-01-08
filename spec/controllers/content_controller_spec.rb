require 'spec_helper'

describe ContentController do
  let(:context){ double() }
  let(:params){ {key: ''} }
  let(:controller){ ContentController.new(context: context, params: params) }
  let(:search_results){ double(paginate: []) }

  before :each do
    controller.stub(:redirect_back)
  end

  describe 'index action' do
    it 'should render index template' do
      context.should_receive(:haml).with('content/index'.to_sym, anything)
      controller.index
    end
  end

  describe 'search action' do
    it 'should render search template' do
      Backend.stub(:search){ search_results }
      context.should_receive(:haml).with('content/search'.to_sym, anything)
      controller.search
    end
  end

  describe 'delete action' do
    it 'should call del on Backend' do
      Backend.should_receive(:del)
      controller.delete
    end
  end

  describe 'change_database' do
    it 'should call set_database' do
      controller.should_receive(:set_database)
      controller.change_database
    end
  end
end