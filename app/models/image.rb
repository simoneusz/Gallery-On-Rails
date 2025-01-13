class Image < ApplicationRecord
  before_save :default_values

  after_create :notify_subscribers

  belongs_to :category
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :record, dependent: :destroy

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

  def notify_subscribers
    category.subscribers.each do |subscriber|
      notification = Notification.create(
        user: subscriber,
        message: "A new picture has been added to the category '#{category.title}'."
      )
      NotificationsChannel.broadcast_to(subscriber, render_notification(notification))
    end
  end

  def render_notification(notification)
    ApplicationController.renderer.render(partial: "layouts/notifications", locals: { notifications: [ notification ] })
  end

  def self.ransackable_associations(auth_object = nil)
    [ "category", "comments", "likes", "user" ]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "category_id", "comments_count", "created_at", "file", "id", "id_value", "image", "likes_count", "title", "updated_at", "user_id" ]
  end
end
