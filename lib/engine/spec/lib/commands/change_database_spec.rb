require_relative '../../spec_helper'

describe ChangeDatabase do
  let(:backend){ Struct.new(:current_database).new(0) }
  let(:database){ '2' }
  let(:command){ ChangeDatabase.new(backend, database) }

  describe 'execute' do
    it 'should point to the new database' do
      backend.should_receive(:select).with(database)
      command.execute
    end

    it 'should change current_database' do
      backend.stub(:select)
      command.execute
      backend.current_database.should eq(database)
    end
  end
end
