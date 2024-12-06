class Image < ApplicationRecord
  belongs_to :category
  belongs_to :user
  mount_uploader :image, ImageUploader

  validates :image, presence: true
  validates :category_id, presence: true
end
