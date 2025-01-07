class SubscriptionsController < ApplicationController
  def create
    category = Category.find(params[:category_id])
    current_user.subscribed_categories << category unless current_user.subscribed_categories.include?(category)
    render json: { success: true }
  end

  def destroy
    category = Category.find(params[:category_id])
    current_user.subscribed_categories.delete(category)
    render json: { success: true }
  end
end
