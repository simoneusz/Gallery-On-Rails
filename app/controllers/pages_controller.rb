class PagesController < ApplicationController
  before_action :authenticate_user!, only: [ :users ], unless: :admin_signed_in?
  before_action :authendicate_admin, only: [ :admin ]
  def home
    @top_categories = Category
      .select("categories.*, COUNT(likes.id) AS likes_count")
      .joins(images: :likes)
      .group("categories.id")
      .order("likes_count DESC")
      .limit(5)
  end
  def users
  end
  def admin
  end
end
