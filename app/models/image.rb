class Image < ApplicationRecord
  belongs_to :category

  mount_uploader :image, ImageUploader

  validates :image, presence: true
  validates :category_id, presence: true
end
