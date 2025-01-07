class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  has_many :images, -> { order(likes_count: :desc) }, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user
  # has_many :subscriptions, dependent: :destroy
  accepts_nested_attributes_for :images
  validates :title, presence: true, uniqueness: true

  def total_likes_count
    images.sum(:likes_count)
  end
end
