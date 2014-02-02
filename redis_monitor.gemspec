# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version'

Gem::Specification.new do |spec|
  spec.name          = 'redis_monitor'
  spec.version       = RedisMonitor::VERSION
  spec.authors       = ['Javier Jimenez']
  spec.email         = %w(javiyu7@gmail.com)
  spec.description   = %q{Get general information of a running redis instance}
  spec.summary       = %q{Get general information of a running redis instance}
  spec.homepage      = 'https://github.com/javiyu/redis_monitor'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w(lib)


  spec.add_runtime_dependency 'redis', '~> 3.0'
  spec.add_runtime_dependency 'rails', '~> 4.0'

  if defined?(JRUBY_VERSION)
    spec.add_runtime_dependency 'activerecord-jdbcsqlite3-adapter'
  else
    spec.add_runtime_dependency 'sqlite3'
  end

  spec.add_runtime_dependency 'jquery-rails'
  spec.add_runtime_dependency 'haml', '~> 4.0'
  spec.add_runtime_dependency 'will_paginate', '~> 3.0.5'
  spec.add_runtime_dependency 'will_paginate-bootstrap'
  spec.add_runtime_dependency 'delayed_job_active_record'
  spec.add_runtime_dependency 'daemons'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 2.14'
  spec.add_development_dependency 'rspec-rails'
end
