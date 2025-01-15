ActiveAdmin.register Category do
  controller do
    def find_resource
      Category.friendly.find(params[:id])
    end
  end
end
