class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  before_action :get_comment

  def index
    @answers = @comment.answers
  end

  def show
  end

  def new
    @answer = @comment.answers.new
  end

  def edit
  end

  def create
    @answer = @comment.answers.new(answer_params)
    @answer.user = current_user
    if @answer.save
      redirect_to article_path(@comment.article), notice: 'Votre commentaire a bien été envoyé. Il sera publié après modération.'
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to article_path(@comment.article), notice: 'Le commentaire a bien été mis à jour.'
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to comment_path(@comment), notice: 'Le commentaire a bien été supprimé.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_answer
    @answer = @comment.answers.find(params[:id])
  end

  def get_comment
    @comment = Comment.find(params[:comment_id])
  end

  def answer_params
    params.permit(:content, :comment_id, :user_id)
  end
end
