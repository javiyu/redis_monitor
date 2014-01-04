require 'spec_helper'

describe CommandLineParser do
  describe 'parse' do
    it 'should read http-server option' do
      args = ['--http-server', 'server']
      CommandLineParser.parse(args)[:http_server].should eq('server')
    end

    it 'should read http-port option' do
      args = ['--http-port', '2222']
      CommandLineParser.parse(args)[:http_port].should eq(2222)
    end

    it 'should read host option' do
      args = ['--host', 'redisdb']
      CommandLineParser.parse(args)[:redis_host].should eq('redisdb')
    end

    it 'should read port option' do
      args = ['--port', '4444']
      CommandLineParser.parse(args)[:redis_port].should eq(4444)
    end

    it 'should read editable option' do
      args = ['--editable']
      CommandLineParser.parse(args)[:permissions][:remove_content].should eq(true)
    end

    it 'should read not-editable option' do
      args = ['--not-editable']
      CommandLineParser.parse(args)[:permissions][:remove_content].should eq(false)
    end

    it 'should read credentials options' do
      args = ['--credentials', 'user:password']
      credentials = CommandLineParser.parse(args)[:credentials]
      credentials[:user].should eq('user')
      credentials[:password].should eq('password')
    end
  end
end
