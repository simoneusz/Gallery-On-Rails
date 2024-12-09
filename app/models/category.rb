class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  has_many :images, -> { order(likes_count: :desc) }, dependent: :destroy
  # has_many :subscriptions, dependent: :destroy
  accepts_nested_attributes_for :images
  validates :title, presence: true, uniqueness: true
end
