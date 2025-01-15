class User < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :subscribed_categories, through: :subscriptions, source: :category
  has_many :notifications, dependent: :destroy
  has_many :activity_logs, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  validates :username,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 16 }

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  mount_uploader :avatar, AvatarUploader

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]

      username = auth.info.name.downcase.delete(' ')
      if User.where(username: username).any?
        Rails.logger.info('THIS USER IS PRESENT')
        username = user.email
      end
      user.username = username
      user.avatar = auth.info.image
      Rails.logger.info('AUTHINFO')
      Rails.logger.info(auth.info)

      user.download_avatar_from_url(auth.info.image) if auth.info.image.present?
    end
  end

  def download_avatar_from_url(url)
    self.remote_avatar_url = url
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[activity_logs categories comments likes notifications subscribed_categories subscriptions]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[avatar avatar_url created_at email encrypted_password id id_value provider
       remember_created_at reset_password_sent_at reset_password_token uid updated_at username]
  end
end
