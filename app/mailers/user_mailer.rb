class UserMailer < ApplicationMailer
  default from: "simonewarlet@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = "http://localhost:3000/login"
    mail(to: @user.email, subject: "Welcome to My Awesome Site")
  end

  def custom_mail(user, subject, body)
    @user = user
    @url  = "http://localhost:3000/login"
    mail(to: @user.email, subject: subject)
  end
end
