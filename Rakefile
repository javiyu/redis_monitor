require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require File.expand_path('../lib/engine/config/application', __FILE__)

Engine::Application.load_tasks

Rake.application.instance_variable_get('@tasks').delete('spec')

RSpec::Core::RakeTask.new(:spec) do |config|
  config.rspec_opts = '--default-path lib/engine/spec'
end

