module ForeverMessageProducer
  require 'sidekiq/client'
  require 'forever_message_producer/workers/message_worker'

  class Notification
    def self.create(args)
      Sidekiq::Client.via(ForeverMessageProducer.message_bus) do
        ForeverMessageProducer::MessageWorker.perform_async(args)
      end
    end
  end
end
