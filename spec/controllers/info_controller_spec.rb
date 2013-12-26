require 'spec_helper'

describe InfoController do
  before :each do
    @context = double(:context)
    @controller = InfoController.new(context: @context)
  end

  describe 'index action' do
    before :each do
      Backend.stub(:info){ {} }
    end

    it 'should not fail' do
      @context.stub(:haml)
      expect{ @controller.index }.not_to raise_error
    end

    it 'should render info template' do
      @context.should_receive(:haml).with('info/info'.to_sym, anything)
      @controller.index
    end
  end
end