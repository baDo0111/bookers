class BooksController < ApplicationController
  def top
  end
  def index
    @books = Book.all.order("id ASC")
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    flash[:notice] = "Book was successfully created"
    if @book.save
    redirect_to book_path(@book.id)
    else
    @books = Book.all
    render 'books/index'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    flash[:notice] = "Book was successfully update"
    if @book.update(book_params)
      redirect_to book_path(@book.id)
    else
      @books =Book.all
      render 'books/edit'
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end