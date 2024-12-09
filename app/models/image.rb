class Image < ApplicationRecord
  before_save :default_values

  belongs_to :category
  belongs_to :user
  mount_uploader :image, ImageUploader

  validates :title, presence: true

  def default_values
    self.likes_count ||= 0
    self.comments_count ||= 0
  end
end
