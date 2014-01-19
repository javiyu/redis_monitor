# RedisMonitor
[![Build Status](https://travis-ci.org/javiyu/redis_monitor.png?branch=master)](https://travis-ci.org/javiyu/redis_monitor)

## Installation

Execute:

    $ gem install redis_monitor

## Usage

    $ redis_monitor --http-port http_port --host redis-host --port redis-port

Then browse http://localhost:http_port

--editable or --not-editable can be use to indicate if the user should be able to edit the database content.
--credentials user:password if only users with credentials can access the application.


For more information about the parameters:

    $ redis_monitor --help

You can define tasks in 'Task' tab and they will be running in background. There is two type of task availables at the moment:
- Watch key, it will watch key introduced in 'trigger' field and it will create notifications if the value change.

- Watch query, it will watch the query introduced in 'trigger' field and in the result of the query changes it will create a notification.
Be careful with this one, don't watch queries too generic because it can affect to the performance of your database.

## Screenshots

![](https://dl.dropboxusercontent.com/u/434578/redis_monitor_images/1.png)

![](https://dl.dropboxusercontent.com/u/434578/redis_monitor_images/2.png)

![](https://dl.dropboxusercontent.com/u/434578/redis_monitor_images/3.png)

![](https://dl.dropboxusercontent.com/u/434578/redis_monitor_images/4.png)

![](https://dl.dropboxusercontent.com/u/434578/redis_monitor_images/5.png)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Please write meaningful test, if you need to execute them:

    $ rake spec
