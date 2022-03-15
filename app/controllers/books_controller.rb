class BooksController < ApplicationController
  def new
  end

  def index
    @lists = List.all
  end

  def show
  end

  def edit
  end
end
