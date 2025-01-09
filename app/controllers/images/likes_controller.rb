class Images::LikesController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :authenticate_user!
  before_action :set_image

  def update
    if @image.liked_by?(current_user)
      @image.unlike(current_user)
      ActivityLog.create(
        user: current_user,
        action_type: "unlikes",
        url: request.referer,
      )
    else
      @image.like(current_user)
      ActivityLog.create(
        user: current_user,
        action_type: "likes",
        url: request.referer,
      )
    end
    respond_to do |format|
      format.turbo_stream {
        render turbo_stream: turbo_stream.replace(dom_id(@image, :likes), partial: "images/likes", locals: { image: @image })
      }
    end
  end

  private

  def set_image
    @image = Image.find(params[:image_id])
  end
end
