class Notification < ApplicationRecord
  belongs_to :user

  after_create :broadcast_notification

  validates :message, presence: true
  validates :user_id, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id id_value message read updated_at user_id]
  end

  def self.ransackable_associations(_auth_object = nil)
    ['user']
  end

  def broadcast_notification
    broadcast_append_to(
      [user, 'notifications'],
      target: 'notifications',
      partial: 'layouts/notifications',
      locals: { notifications: [self] }
    )
  end
end
