require 'spec_helper'

describe ContentController do
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
      Backend.stub(:search){ {} }
      @context.should_receive(:haml).with('content/search'.to_sym, anything)
      @controller.search
    end
  end
end