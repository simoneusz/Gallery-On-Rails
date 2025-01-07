class CategorySubscriptionChannel < ApplicationCable::Channel
  def subscribed
    category = Category.friendly.find(params[:category_id])
    stream_for category
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
