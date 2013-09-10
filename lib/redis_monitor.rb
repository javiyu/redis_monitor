require 'server/command_line_parser'
require 'server/server'

module RedisMonitor
  def self.run
    arguments = CommandLineParser.parse(ARGV.dup)
    Backend.config(arguments)
    Server.config(arguments)
    Server.run!
  end
end
