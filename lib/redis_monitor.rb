require 'server/command_line_parser'
require 'server/server'
require 'modules/authorization'

module RedisMonitor
  def self.run
    arguments = CommandLineParser.parse(ARGV.dup)
    Backend.config(arguments)
    Server.config(arguments)
    Authorization.config(arguments[:permissions])
    Server.run!
  end
end
