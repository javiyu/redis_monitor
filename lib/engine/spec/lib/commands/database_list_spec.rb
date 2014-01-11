require_relative '../../spec_helper'

describe DatabaseList do
  let(:backend){ double() }
  let(:command){ DatabaseList.new(backend) }

  describe 'result' do
    it 'should retrieve all database identifiers' do
      backend.stub(:info){ {db0: '', db1: '', example: ''} }

      command.result.should include('0')
      command.result.should include('1')
    end
  end
end
