require 'spec_helper'

describe ContentController do
  let(:search_results){ double(paginate: []) }

  before :each do
    @context = double(:context)
    @controller = ContentController.new(context: @context)
  end

  describe 'index action' do
    it 'should render index template' do
      @context.should_receive(:haml).with('content/index'.to_sym, anything)
      @controller.index
    end
  end

  describe 'search action' do
    it 'should render search template' do
      Backend.stub(:search){ search_results }
      @context.should_receive(:haml).with('content/search'.to_sym, anything)
      @controller.search
    end
  end

  describe 'delete action' do
    before :each do
      Backend.stub(:del)
    end

    it 'should redirect to the referer if exists' do
      @controller.stub(:http_referer){ '/referer' }
      @context.should_receive(:redirect).with('/referer')
      @controller.delete
    end

    it 'should redirect to search page if referer does not exists' do
      @controller.stub(:http_referer){ nil }
      @context.should_receive(:redirect).with('/content/search')
      @controller.delete
    end
  end
end