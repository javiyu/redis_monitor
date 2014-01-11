require_relative '../../spec_helper'

describe RemoveKey do
  let(:backend){ double() }
  let(:key){ 'key' }
  let(:command){ RemoveKey.new(backend, key) }

  describe 'execute' do
    it 'should not delete content if not allowed' do
      Authorization.stub(:authorized_for?).with(:remove_content){ false }
      backend.should_receive(:del).never
      command.execute
    end

    it 'should remove content if allowed' do
      Authorization.stub(:authorized_for?).with(:remove_content){ true }
      backend.should_receive(:del)
      command.execute
    end
  end
end
