# ForeverMessageProducer

A common gem for messaging between Forever apps.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'forever_message_producer'
```

## Configuration

Add `MESSAGE_BUS_REDIS_URL` to your application.yml and provide the URL to the
Redis instance that is hosting the message worker queue.  Typically, this Redis
is defined on the NGINX app (since it is common to all and shared between them).

In development, leave this blank so it will default to localhost.

Example:

```ruby
# config/initializers/forever_message_producer.rb
ForeverMessageProducer.configure do |config|
  config.message_bus = { url: ENV.fetch(ENV['MESSAGE_BUS_REDIS_URL'].to_s) { 'redis://localhost:6379' } }
end
```

### Message Bus Config Hash Options
* url: the message bus redis url (required)
* pool_size: the redis connection pool size (optional, default 5)
* pool_timeout: the redis connection pool timeout (optional, default 1)

All other options will be passed to the Redis initializer.

## Usage

TODO: Write usage instructions here
