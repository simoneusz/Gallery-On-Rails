class NotifySubscribersJob < ApplicationJob
  queue_as :default

  def perform(*args)
    CategorySubscriptionChannel.broadcast_to(
      category,
      { message: message }
    )
  end
end
