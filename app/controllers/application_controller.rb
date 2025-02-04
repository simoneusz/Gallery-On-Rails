class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_notifications
  before_action :set_locale
  after_action :track_navigation

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
  end

  def default_url_options
    { locale: I18n.locale }
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def track_navigation
    return unless current_user

    ActivityLog.create(
      user: current_user,
      action_type: 'navigation',
      url: request.fullpath
    )
  end

  def set_notifications
    @notifications = []
    return unless user_signed_in?

    @notifications = current_user.notifications.where(read: false)
  end
end
