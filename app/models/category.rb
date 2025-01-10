class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  has_many :images, -> { order(likes_count: :desc) }, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :subscribers, through: :subscriptions, source: :user
  # has_many :subscriptions, dependent: :destroy
  accepts_nested_attributes_for :images
  validates :title, presence: true, uniqueness: true

  def total_likes_count
    images.sum(:likes_count)
  end

  def next
    category = Category.where("id > ?", self.id).first
    category.nil? ? Category.first : category
  end

  def previous
    category = Category.where("id < ?", self.id).first
    category.nil? ? Category.first : category
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "description", "id", "id_value", "slug", "title", "updated_at", "user_id" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "comments", "images", "subscribers", "subscriptions", "user" ]
  end
end
