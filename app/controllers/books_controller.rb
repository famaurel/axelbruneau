class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path, notice: 'Le livre a bien été créé.'
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Le livre a bien été modifié."
      redirect_to books_path
    else
      flash[:notice] = "Erreur : le livre n'a pas pu être modifié."
      render 'edit'
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :description)
  end

end
