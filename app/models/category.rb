class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  has_many :images, dependent: :destroy
  # has_many :subscriptions, dependent: :destroy

  validates :title, presence: true, uniqueness: true
end
