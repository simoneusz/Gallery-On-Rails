class CleanupJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    puts 'Staring cleanup...'
    activity_log_size = ActivityLog.all.size
    return unless activity_log_size > 100

    ActivityLog.first(activity_log_size - 100).map { |activity| activity.destroy }
    puts "Current log size #{ActivityLog.all.size}"
  end
end
