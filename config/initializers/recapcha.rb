Recaptcha.configure do |config|
  config.site_key = ENV['recaptcha_site_key'] || Rails.application.credentials.recaptcha_site_key
  config.secret_key = ENV['recaptcha_secret_key'] || Rails.application.credentials.recaptcha_secret_key
end
