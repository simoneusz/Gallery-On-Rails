namespace :app do
  desc "Add Notification to user"
  task create_notifications: :environment do
    default_user = User.find_or_create_by!(email: "simoneewarlet@gmail.com") do |user|
      user.username = "simoneuszz"
      user.password = "simoneewarlet@gmail.com"
    end
    notification = Notification.new(user_id: default_user.id, message: "Test message from create_notifications")
    if notification.save
      puts "Notification for #{default_user.username} has been saved"
    else
      puts "Cant create message for #{default_user.username}"
    end
  end
end
