ActiveAdmin.register Image do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :file, :likes_count, :comments_count, :user_id, :category_id, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :file, :likes_count, :comments_count, :user_id, :category_id, :image]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
