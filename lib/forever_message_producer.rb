module ForeverMessageProducer
  require "forever_message_producer/version"
  require 'forever_message_producer/notification'
  require 'sidekiq/redis_connection'

  def self.configure
    yield self
  end

  def self.message_bus
    @connection_pool
  end

  def self.message_bus=(config)
    config       = config.dup
    pool_size    = config.delete(:pool_size) || 5
    pool_timeout = config.delete(:pool_timeout) || 1

    @connection_pool = Sidekiq::RedisConnection.create(config.merge(size: pool_size, pool_timeout: pool_timeout))
  end
end
