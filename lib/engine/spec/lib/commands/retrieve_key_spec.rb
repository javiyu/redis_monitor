require_relative '../../spec_helper'

describe RetrieveKey do
  let(:backend){ double() }
  let(:key){ 'key' }
  let(:value){ 'value' }
  let(:command){ RetrieveKey.new(backend, key) }

  describe 'result' do
    it 'should return the value associated to the key' do
      backend.stub(:get){ value }
      command.result.should == value
    end
  end
end