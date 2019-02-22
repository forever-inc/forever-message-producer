module ForeverMessageProducer
  require 'sidekiq/client'
  require 'forever_message_producer/workers/notification_message_worker'

  class Notification
    def self.create(primary_type, subtype, recipient_id, body = {}, item_id = nil, expires_at = nil)
      params = {
        primary_type: primary_type,
        subtype:      subtype,
        recipient_id: recipient_id,
        body:         body,
        item_id:      item_id,
        expires_at:   expires_at
      }

      Sidekiq::Client.via(ForeverMessageProducer.message_bus) do
        ForeverMessageProducer::NotificationMessageWorker.perform_async(params)
      end
    end
  end
end
