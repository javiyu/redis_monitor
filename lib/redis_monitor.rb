require 'base64'
require 'command_line_parser'

module RedisMonitor
  def self.parse_arguments
    CommandLineParser.parse(ARGV.dup)
  end

  def self.store_arguments(args)
    ENV['REDIS_MONITOR_OPTS'] = Base64.encode64(Marshal.dump(args))
  end

  def self.environment
    'production'
  end

  def self.base_folder
    File.dirname(__FILE__)
  end

  def self.rakefile_path
    "#{base_folder}/engine/Rakefile"
  end

  def self.run
    args = parse_arguments
    store_arguments(args)

    system("#{base_folder}/engine/bin/rake", '-f', rakefile_path, 'db:migrate', "RAILS_ENV=#{environment}")
    system("#{base_folder}/engine/bin/delayed_job", 'restart', "RAILS_ENV=#{environment}")
    system("#{base_folder}/engine/bin/rails", 's', '-p', args[:http_port].to_s, '-e', environment)
  end
end
