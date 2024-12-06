class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]
  before_action :set_user
  before_action :set_category, only: [ :show, :edit, :update, :destroy ]

  def index
    @categories = @user.categories
  end

  def show
  end

  def new
    @category = @user.categories.build
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to user_categories_path(current_user), notice: "Category has been created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_category
    @category = @user.categories.friendly.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :description, :image)
  end
end
