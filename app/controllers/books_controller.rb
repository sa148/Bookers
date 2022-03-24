class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end
    if @book.save
      flash[:alert] = "Book was successfully created."
      redirect_to book_path(@book.id)
    end
  end

  def show
    @book =Book.find(params[:id])
  end


  def index
    @books = Book.all
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if list.update(book_params)
    flash[:alert] = "Book was successfully updated."
    redirect_to book_path(book.id)
    end
  end

   private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
