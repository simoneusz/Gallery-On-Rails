module Images
  class LikesController < ApplicationController
    include ActionView::RecordIdentifier

    before_action :authenticate_user!
    before_action :set_image

    def update
      if @image.liked_by?(current_user)
        unlike_image
      else
        like_image
      end

      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(dom_id(@image, :likes), partial: 'images/likes',
                                                                            locals: { image: @image })
        end
      end
    end

    def set_image
      @image = Image.find(params[:image_id])
    end

    private

    def like_image
      @image.like(current_user)
      create_activity_log('likes')
    end

    def unlike_image
      @image.unlike(current_user)
      create_activity_log('unlikes')
    end

    def create_activity_log(action_type)
      ActivityLog.create(
        user: current_user,
        action_type: action_type,
        url: request.referer
      )
    end
  end
end
