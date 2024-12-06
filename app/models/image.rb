class Image < ApplicationRecord
  belongs_to :category
  belongs_to :user
  mount_uploader :image, ImageUploader

  validates :title, presence: true
end
