class CategorySubscriptionChannel < ApplicationCable::Channel
  def subscribed
    category = Category.friendly.find(params[:category_id])
    stream_for category
  end

  def unsubscribed
  end
end
