class ArticlesController < ApplicationController
  # before_action :get_category
  # before_action :set_article, only: [:show, :edit, :update, :destroy]

  skip_before_action :authenticate_user!, only: [:index, :show]

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
    @article = Article.find(params[:id])
    @categories = Category.all
  end

  def create
    @article = Article.new(article_params)
    @categories = Category.all
    if @article.save
      flash[:notice] = "L'article a bien été créé."
      redirect_to root_path
    else
      flash[:notice] = "L'article n'a pas pu être créé."
      render :new
    end
  end

  def update
    @article = Article.find(params[:id])
    @categories = Category.all
    @category = @article.category
    if @article.update(article_params)
      flash[:notice] = "L'article a bien été modifié."
      redirect_to category_article_path(@category)
    else
      flash[:notice] = "Erreur : l'article n'a pas pu être modifié."
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @category = @article.category
    @article.destroy
    redirect_to category_path(@category), notice: "L'article a bien été supprimé"
  end

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
