class Notification < ApplicationRecord
  belongs_to :user

  validates :message, presence: true
  after_create :broadcast_notification

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "id", "id_value", "message", "read", "updated_at", "user_id" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "user" ]
  end

  def broadcast_notification
    broadcast_append_to(
      [ self.user, "notifications" ],
      target: "notifications",
      partial: "layouts/notifications",
      locals: { notifications: [ self ] }
    )
  end
end
