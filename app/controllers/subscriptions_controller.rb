class SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category

  def create
    subscription = @category.subscriptions.build(user: current_user)
    if subscription.save
      redirect_to @category, notice: "You have subscribed to this category."
    else
      redirect_to @category, alert: subscription.errors.full_messages.to_sentence
    end
  end

  def destroy
    subscription = @category.subscriptions.find_by(user: current_user)
    if subscription
      subscription.destroy
      redirect_to @category, notice: "You have unsubscribed from this category."
    else
      redirect_to @category, alert: "You are not subscribed to this category."
    end
  end

  private

  def set_category
    @category = Category.friendly.find(params[:category_id])
  end
end
