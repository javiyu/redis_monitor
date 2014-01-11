require_relative '../../spec_helper'

describe SearchKey do
  let(:backend){ double() }
  let(:key){ 'key' }
  let(:command){ SearchKey.new(backend, key) }
  let(:keys_found){ ['k1', 'k2', 'k3'] }

  describe 'result' do
    before :each do
      backend.stub(:keys){ keys_found }
      backend.stub(:get){ 'value' }
    end

    it 'should return an array of hashes' do
      command.result.should be_kind_of(Array)
      command.result[0].should be_kind_of(Hash)
    end

    it 'every entry should have key and value data' do
      command.result[0][:key].should_not be_nil
      command.result[0][:value].should_not be_nil
    end
  end
end