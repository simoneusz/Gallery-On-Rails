class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category

  def create
    @comment = @category.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      ActivityLog.create(
        user: current_user,
        action_type: "comments",
        url: request.referer
      )
      redirect_to @category, notice: "Comment added successfully."
    else
      redirect_to @category, alert: "Comment cannot be empty."
    end
  end

  private

  def set_category
    @category = Category.friendly.find(params[:category_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end

class CommentsController < ApplicationController
end
