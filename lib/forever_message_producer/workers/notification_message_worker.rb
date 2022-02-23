module ForeverMessageProducer
  require 'sidekiq'
  require 'sidekiq/worker'

  class NotificationMessageWorker
    include Sidekiq::Worker

    def self.client_push(item)
      recipient_ids = Array(item['args'][0]['recipient_id'])

      recipient_ids.each do |recipient_id|
        new_item                            = item.deep_dup
        new_item['args'][0]['recipient_id'] = recipient_id
        new_item['class']                   = 'NotificationMessageWorker'
        new_item['queue']                   = "notification_messages_#{sidekiq_shard(recipient_id)}"

        super(new_item)
      end
    end

    # 1 to 4
    private_class_method def self.sidekiq_shard(uuid)
      (uuid[0..2].to_i(16) % 4) + 1
    end
  end
end
