require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require File.expand_path('../lib/engine/config/application', __FILE__)

Engine::Application.load_tasks

RSpec::Core::RakeTask.new(:spec) do |config|
  config.rspec_opts = '--default-path lib/engine/spec'
end

