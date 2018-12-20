module ForeverMessageProducer
  require "forever_message_producer/version"
  require 'forever_message_producer/notification'
  require 'connection_pool'
  require 'redis'

  def self.configure
    yield self
  end

  def self.message_bus
    @connection_pool
  end

  def self.message_bus=(config)
    pool_size    = config.delete(:pool_size) || 5
    pool_timeout = config.delete(:pool_timeout) || 1

    @connection_pool = ConnectionPool.new(size: pool_size, timeout: pool_timeout) do
      Redis.new(config)
    end
  end
end
