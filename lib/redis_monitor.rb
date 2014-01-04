require 'server/command_line_parser'
require 'server/server'
require 'modules/security/authorization'
require 'modules/security/authentication'

module RedisMonitor
  def self.run
    arguments = CommandLineParser.parse(ARGV.dup)
    Backend.config(arguments)
    Server.config(arguments)
    Authorization.config(arguments[:permissions])
    Authentication.config(Server, arguments[:credentials])

    Server.run!
  end
end
