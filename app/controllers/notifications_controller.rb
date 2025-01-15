class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def create
    render json: {}, status: :no_content
  end

  def index
    @notifications = current_user.notifications.order(created_at: :desc)
  end

  def update
    notification = current_user.notifications.find(params[:id])
    notification.update(read: true)
    redirect_to notifications_path, notice: 'Notification marked as read.'
  end

  def mark_as_read
    notification = Notification.find(params[:id])
    if notification.update(read: true)
      Rails.logger.info('Notification mark_as_read passed')
    else
      Rails.logger.info('Notification mark_as_read failed')
    end
  end
end
