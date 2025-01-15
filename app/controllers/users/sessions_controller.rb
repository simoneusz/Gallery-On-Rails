# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    def create
      super
      return unless current_user

      ActivityLog.create(
        user: current_user,
        action_type: 'Login',
        url: request.referer
      )
    end

    # DELETE /resource/sign_out
    def destroy
      if current_user
        ActivityLog.create(
          user: current_user,
          action_type: 'Logout',
          url: request.referer
        )
      end
      super
    end

    def after_sign_out_path_for(_resource_or_scope)
      new_user_session_path
    end

    def after_sign_in_path_for(resource_or_scope)
      stored_location_for(resource_or_scope) || root_path
    end
  end
end
