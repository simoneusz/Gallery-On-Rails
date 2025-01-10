class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(user_id, subject, body)
    user = User.find(user_id)
    return if user.nil? || subject.nil? || body.nil?
    puts "At #{Time.now}: "
    puts "Starting to sending email for #{user.username}.."
    puts user.email
    UserMailer.custom_mail(user).deliver_later
  end
end
