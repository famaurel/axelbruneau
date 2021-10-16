class CommentsController < ApplicationController
  before_action :get_article
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_category

  def index
    @comments = @article.comments
  end

  def show
  end

  def new
    @comment = @article.comments.new
  end

  def edit
  end

  def create
    @comment = @article.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to category_article_path(@category, @article, :anchor => "comment-#{@comment.id}"), notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to category_article_path(@article, :anchor => "comment-#{@comment.id}"), notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to article_path(@article), notice: 'Comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def get_article
    @article = Article.find(params[:article_id])
  end

  def set_comment
    @comment = @article.comments.find(params[:id])
  end

  def set_category
    @category = @article.category
  end

  def comment_params
    params.permit(:content, :article_id, :user_id)
  end
end
