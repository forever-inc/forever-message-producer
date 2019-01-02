module ForeverMessageProducer
  require 'sidekiq/client'
  require 'forever_message_producer/workers/notification_message_worker'

  class Notification
    def self.create(args)
      Sidekiq::Client.via(ForeverMessageProducer.message_bus) do
        ForeverMessageProducer::NotificationMessageWorker.perform_async(args)
      end
    end
  end
end
