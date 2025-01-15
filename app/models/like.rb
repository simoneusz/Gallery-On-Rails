class Like < ApplicationRecord
  belongs_to :user
  belongs_to :record, polymorphic: true, counter_cache: true

  validates :user_id, presence: true
  validates :record_type, presence: true
  validates :record_id, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id id_value likes_count record_id record_type updated_at user_id]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[record user]
  end
end
