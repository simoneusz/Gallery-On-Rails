class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :content, presence: true, length: { minumum: 1, maximum: 140 }

  def self.ransackable_attributes(auth_object = nil)
    [ "category_id", "content", "created_at", "id", "id_value", "updated_at", "user_id" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "category", "user" ]
  end
end
