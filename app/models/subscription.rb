class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :user_id, presence: true
  validates :category_id, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[category_id created_at id id_value updated_at user_id]
  end
end
