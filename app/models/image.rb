class Image < ApplicationRecord
  before_save :default_values

  belongs_to :category
  belongs_to :user
  has_many :likes, as: :record

  mount_uploader :image, ImageUploader

  validates :title, presence: true

  def liked_by?(user)
    likes.where(user: user).any?
  end

  def like(user)
    likes.where(user: user).first_or_create
  end

  def unlike(user)
    likes.where(user: user).destroy_all
  end

  private

  def default_values
    self.likes_count ||= 0
    self.comments_count ||= 0
  end
end
