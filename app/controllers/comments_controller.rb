class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :get_article

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
      redirect_to article_path(@article), notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      format.html { redirect_to article_path(@article), notice: 'Comment was successfully updated.' }
    else
      format.html { render :edit }
    end
  end

  def destroy
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to article_path(@article), notice: 'Comment was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = @article.comments.find(params[:id])
  end

  def get_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.permit(:content, :article_id, :user_id)
  end
end
