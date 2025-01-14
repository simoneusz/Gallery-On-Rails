class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  has_many :images, -> { order(likes_count: :desc) }, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :subscribers, through: :subscriptions, source: :user
  accepts_nested_attributes_for :images

  validates :title, presence: true, uniqueness: true, length: { minumum: 1, maximum: 24 }
  validates :description, presence: true
  validates :user_id, presence: true

  def total_likes_count
    images.sum(:likes_count)
  end

  def next
    Category.where("id > ?", self.id).order(:id).first || Category.order(:id).first
  end

  def previous
    Category.where("id < ?", self.id).order(id: :desc).first || Category.order(id: :desc).first
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "description", "id", "id_value", "slug", "title", "updated_at", "user_id" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "comments", "images", "subscribers", "subscriptions", "user" ]
  end
end
