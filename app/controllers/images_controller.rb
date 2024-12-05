class ImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_image, only: [ :show, :destroy ]

  def new
    @image = @category.images.new
  end

  def show
    @comments = @image.comments
  end

  def create
    @image = @category.images.new(image_params)
    if @image.save
      redirect_to category_path(@category), notice: "Image successfully added."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def image_params
    params.require(:image).permit(:image, :description)
  end
end
