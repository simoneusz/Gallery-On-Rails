class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @commentable = find_commentable
    @comment = @commentable.comments
  end

  def create
    @commentable = find_commentable
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      ActivityLog.create(
        user: current_user,
        action_type: "comments",
        url: request.referer
      )
      redirect_to @commentable, notice: "Comment added successfully."
    else
      redirect_to @commentable, alert: "Comment cannot be empty."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_commentable
    if params[:category_id]
      Category.friendly.find(params[:category_id])
    elsif params[:image_id]
      Image.find(params[:image_id])
    end
  end
end
