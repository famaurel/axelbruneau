class ArticlesController < ApplicationController
  # before_action :get_category
  # before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @category = Category.find(params[:category_id])
    @article = @category.articles.find(params[:id])
  end

  # def new
  #   @article = @category.articles.new
  # end
  #
  # def edit
  # end
  #
  # def create
  #   @article = @category.articles.new(article_params)
  #   @article.user = current_user
  #   if @article.save
  #     redirect_to category_path(@category), notice: 'article was successfully posted.'
  #   else
  #     render :new
  #   end
  # end

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
      params.require(:article).permit(:title, :content, :category_id, :user_id)
    end
end
