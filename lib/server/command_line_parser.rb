require 'optparse'

module RedisMonitor
  class CommandLineParser
    DEFAULTS = {
      http_server: 'webrick',
      http_port: 6369,
      redis_host: 'localhost',
      redis_port: 6379,
    }

    def self.parse(argv)
      arguments = DEFAULTS.dup

      parser = OptionParser.new do |op|
        op.on('--http-server server', 'specify rack server/handler (default is thin)') do |val|
          arguments[:http_server] = val
        end
        op.on('--http-port port',  'specify http port (default is 6369)') do |val|
          arguments[:http_port] = val.to_i
        end
        op.on('--host host',  'specify redis host (default is localhost)') do |val|
          arguments[:redis_host] = val
        end
        op.on('--port port',  'specify redis port (default is 6379)') do |val|
          arguments[:redis_port] = val.to_i
        end
        op.on('--editable',  'the content will be editable (default is editable)') do |val|
          arguments[:permissions] ||= {}
          arguments[:permissions][:remove_content] = true
        end
        op.on('--not-editable',  'the content will be not editable (default is editable)') do |val|
          arguments[:permissions] ||= {}
          arguments[:permissions][:remove_content] = false
        end
      end
      parser.parse!(argv)

      arguments
    end
  end
end

