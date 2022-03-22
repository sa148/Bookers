class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path(book.id)
  end

  def show
    @books =Book.find(params[:id])
  end


  def index
    @books = Book.all
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    list.update(book_params)
    redirect_to book_path(book.id)
  end

   private
  def list_params
    params.require(:book).permit(:title, :body)
  end
end
