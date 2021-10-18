class CommentsController < ApplicationController
  before_action :get_article, except: [:index, :edit, :update, :destroy]
  before_action :set_comment, only: [:show]
  before_action :set_category, except: [:index, :edit, :update, :destroy]
  before_action :set_user

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = @article.comments.new
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = @article.comments.new(comment_permit)
    if @comment.save
      CommentMailer.with(comment: @comment).new_comment_email.deliver_later
      redirect_to category_article_path(@category, @article), :anchor => "comment-#{@comment.id}", notice: 'Votre commentaire a bien été envoyé. Il sera publié après modération.'
    else
      redirect_to category_article_path(@category, @article), notice: "Erreur : Le commentaire n'a pas pu être publié."
    end
  end

  def update
      @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to comments_path, notice: 'Le commentaire a bien été modifié.'
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_path, notice: 'Le commentaire a bien été détruit.'
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

  def set_user
    @user = current_user
  end

  def comment_params
    params.require(:comment).permit(:content, :published, :article_id, :user_id, :category_id)
  end

  def comment_permit
    params.permit(:content, :published, :article_id, :user_id, :category_id)
  end

end
