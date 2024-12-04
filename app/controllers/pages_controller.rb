class PagesController < ApplicationController
  before_action :authenticate_user!, only: [ :users ], unless: :admin_signed_in?
  before_action :authendicate_admin, only: [ :admin ]
  def home
  end
  def users
  end
  def admin
  end
end
