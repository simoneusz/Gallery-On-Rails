class ActivityLog < ApplicationRecord
  belongs_to :user

  validates :action_type, presence: true
  validates :url, presence: true

  def self.ransackable_attributes(auth_object = nil)
    [ "action_type", "created_at", "id", "id_value", "updated_at", "url", "user_id" ]
  end
end
