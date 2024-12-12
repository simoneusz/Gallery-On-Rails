class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :content, presence: true, length: { minumum: 1, maximum: 140 }
end
