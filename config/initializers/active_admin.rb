ActiveAdmin.setup do |config|
  config.site_title = "Gallery On Rails"
  config.clear_javascripts!
  config.register_javascript "https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.js"
  config.register_javascript "https://cdn.jsdelivr.net/npm/jquery-ujs@1.2.3/src/rails.min.js"
  config.register_javascript "https://cdn.jsdelivr.net/npm/jquery-ui@1.13.2/dist/jquery-ui.min.js"
  config.register_javascript "https://cdn.jsdelivr.net/npm/@activeadmin/activeadmin@2.13.1/app/assets/javascripts/active_admin/base.min.js"

  config.authentication_method = :authenticate_admin_user!

  config.current_user_method = :current_admin_user

  config.logout_link_path = :destroy_admin_user_session_path

  config.batch_actions = true

  config.filter_attributes = [ :encrypted_password, :password, :password_confirmation ]

  config.localize_format = :long

  config.use_webpacker = false
end
