# ForeverMessageProducer

A common gem for messaging between Forever apps.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'forever_message_producer'
```

## Configuration

```ruby
# config/initializers/forever_message_producer.rb
ForeverMessageProducer.configure do |config|
  config.message_bus = # message bus config hash
end
```

### Message Bus Config Hash Options
* url: the message bus redis url (required)
* pool_size: the redis connection pool size (optional, default 5)
* pool_timeout: the redis connection pool timeout (optional, default 1)

All other options will be passed to the Redis initializer.

## Usage

TODO: Write usage instructions here
