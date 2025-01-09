class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :track_navigation

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [ :avatar ])
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :avatar ])
  end

  private

  def track_navigation
    return unless current_user
    ActivityLog.create(
      user: current_user,
      action_type: "navigation",
      url: request.fullpath
    )
  end
end
