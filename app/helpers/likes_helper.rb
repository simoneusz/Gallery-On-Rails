module LikesHelper
  def like_button_icon(record)
    if record.liked_by?(current_user)
      '<i class="bi bi-suit-heart-fill svg-red"></i>'.html_safe
    else
      '<i class="bi bi-suit-heart"></i>'.html_safe
    end
  end
end
