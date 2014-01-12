require_relative '../../spec_helper'

describe ChangeDatabase do
  let(:backend){ Struct.new(:current_database).new(0) }
  let(:database){ '2' }
  let(:session){ Struct.new(:database).new(0) }
  let(:command){ ChangeDatabase.new(backend, session, database) }

  describe 'execute' do
    before :each do
      backend.stub(:select)
    end

    it 'should change current_database' do
      command.execute
      backend.current_database.should eq(database)
    end

    it 'should save current_database in session' do
      command.execute
      session[:database].should eq(database)
    end
  end
end
