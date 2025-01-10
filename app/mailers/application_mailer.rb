class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.smtp_username
  layout "mailer"
end
