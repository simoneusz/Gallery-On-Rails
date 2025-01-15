class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :content, presence: true, length: { minimum: 1, maximum: 140 }
  validates :user_id, presence: true
  validates :commentable_type, presence: true
  validates :commentable_id, presence: true

  def self.ransackable_associations(_auth_object = nil)
    %w[commentable user]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[commentable_id commentable_type content created_at id id_value updated_at user_id]
  end
end
