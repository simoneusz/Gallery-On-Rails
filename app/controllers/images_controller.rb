class ImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category

  def new
    @image = @category.images.new
  end

  def create
    @image = @category.images.build(image_params)
    @image.user = current_user
    if @image.save
      redirect_to category_path(@category), notice: "Image successfully uploaded."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_category
    @category = Category.friendly.find(params[:category_id])
  end

  def image_params
    params.require(:image).permit(:title, :image)
  end
end
