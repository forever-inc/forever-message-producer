module ForeverMessageProducer
  require 'sidekiq'
  require 'sidekiq/worker'

  class MessageWorker
    include Sidekiq::Worker

    def self.client_push(item)
      item['class'] = 'MessageWorker'
      item['queue'] = 'messages'
      super(item)
    end
  end
end
