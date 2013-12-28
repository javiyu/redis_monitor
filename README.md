# RedisMonitor
[![Build Status](https://travis-ci.org/javiyu/redis_monitor.png?branch=master)](https://travis-ci.org/javiyu/redis_monitor)

## Installation

Add this line to your application's Gemfile:

    gem 'redis_monitor'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install redis_monitor

## Usage

    $ redis_monitor --http-port http_port --host host --port port

Then browse http://localhost:http_port

For more information about the parameters:

    $ redis_monitor --help

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Please write meaningful test, if you need to execute them:

    $ rspec spec
