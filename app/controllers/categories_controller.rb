class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]
  before_action :set_category, only: [ :show, :edit, :update, :destroy ]

  def index
    @categories = Category.includes(:images).order(created_at: :desc).page(params[:page]).per(5)
    # @categories = Kaminari.paginate_array(Category.first(10)).page(params[:page])
  end

  def show
    # @images = @category.page(params[:page]).per(5)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    if @category.save
      redirect_to @category
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_category
    @category = Category.friendly.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :description)
  end
end
