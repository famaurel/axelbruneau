class CategoriesController < ApplicationController
  before_action :set_articles
  before_action :get_category

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category yes"
      redirect_to category_path(@category)
    else
      flash[:error] = "Category no"
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def get_category
  end

  def set_articles

  end

  def category_params
    params.require(:category).permit(:name)
  end
end
