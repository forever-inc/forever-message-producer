module ForeverMessageProducer
  require 'sidekiq/job'
  require 'forever_message_producer/workers/notification_message_worker'

  class Notification
    def self.create(primary_type, subtype, recipient_id, body = {}, item_id = nil, expires_at = nil)
      params = {
        'primary_type' => primary_type,
        'subtype'      => subtype,
        'recipient_id' => recipient_id,
        'body'         => body,
        'item_id'      => item_id,
        'expires_at'   => expires_at
      }

      ForeverMessageProducer::NotificationMessageWorker
        .set(pool: ForeverMessageProducer.message_bus)
        .perform_async(params)
    end
  end
end
