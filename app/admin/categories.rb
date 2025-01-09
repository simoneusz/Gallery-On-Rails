ActiveAdmin.register Category do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :description, :slug, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :description, :slug, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  controller do
    def find_resource
      Category.friendly.find(params[:id])
    end
  end
end
