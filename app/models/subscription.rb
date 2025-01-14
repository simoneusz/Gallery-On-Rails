class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :user_id, presence: true
  validates :category_id, presence: true

  def self.ransackable_attributes(auth_object = nil)
    [ "category_id", "created_at", "id", "id_value", "updated_at", "user_id" ]
  end
end
