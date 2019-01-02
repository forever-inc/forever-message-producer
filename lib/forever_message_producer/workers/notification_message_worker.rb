module ForeverMessageProducer
  require 'sidekiq'
  require 'sidekiq/worker'

  class NotificationMessageWorker
    include Sidekiq::Worker

    def self.client_push(item)
      item['class'] = 'NotificationMessageWorker'
      item['queue'] = 'notification_messages'
      super(item)
    end
  end
end
