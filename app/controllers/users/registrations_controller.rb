# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    def create
      super
      return unless current_user

      send_email_to_current_user
    end

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end

    private

    def send_email_to_current_user
      @user = current_user
      SendEmailJob.perform_later(@user.id, 'Test email subject', 'Test email body body body body body body body')
    end
  end
end
