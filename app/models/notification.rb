class Notification < ApplicationRecord
  belongs_to :user

  validates :message, presence: true

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "id", "id_value", "message", "read", "updated_at", "user_id" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "user" ]
  end
end
