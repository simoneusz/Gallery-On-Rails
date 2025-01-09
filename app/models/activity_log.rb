class ActivityLog < ApplicationRecord
  belongs_to :user

  validates :action_type, presence: true
  validates :url, presence: true
end
