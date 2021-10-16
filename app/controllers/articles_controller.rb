class ArticlesController < ApplicationController
  # before_action :get_category
  # before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5).reverse_order
  end

  def show
    @category = Category.find(params[:category_id])
    @article = @category.articles.find(params[:id])
  end

  def new
    @article = Article.new
    # @categories = Category.all.map { |n| n[:id] }
    # @category_names = Category.all.map { |n| n[:name] }
    @categories = Category.all
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @categories = Category.all
    if @article.save
      redirect_to root_path, notice: 'article was successfully posted.'
    else
      render :new
    end
  end

  # def update
  #   if @article.update(article_params)
  #     flash[:notice] = "category was updated"
  #     redirect_to category_path(@category)
  #   else
  #     flash[:notice] = "category was not updated"
  #     render 'edit'
  #   end
  # end
  #
  # def destroy
  #   @article.destroy
  #   redirect_to category_path(@category), notice: 'article was successfully destroyed.'
  # end

  private

    # def get_category
    #   @category = @article.categories.find(params[:id])
    # end

    # def set_article
    #
    # end

    def article_params
      params.require(:article).permit(:title, :content, :category_id)
    end
end
