class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(user_id, subject, body)
  end
end
