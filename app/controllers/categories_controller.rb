class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]
  before_action :set_user
  before_action :set_category, only: [ :show, :edit, :update, :destroy ]

  def index
    @categories = @user.categories
  end

  def show
    @images = @category.images.page(params[:page]).per(5)
  end

  def new
    @category = @user.categories.build
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to @category, notice: "Category has been created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: "Category has been deleted."
  end

  private

  def set_user
    @user = User.find_by(id: params[:user_id])
    @user = current_user if @user.nil?
  end

  def set_category
    @category = Category.friendly.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :description, :image)
  end
end
