require 'base64'
require 'command_line_parser'

module RedisMonitor
  def self.parse_arguments
    CommandLineParser.parse(ARGV.dup)
  end

  def self.store_arguments(args)
    ENV['REDIS_MONITOR_OPTS'] = Base64.encode64(Marshal.dump(args))
  end

  def self.run
    args = parse_arguments
    store_arguments(args)

    system('lib/engine/bin/rails', 's', '-p', args[:http_port].to_s, '-e', 'production')
  end
end
