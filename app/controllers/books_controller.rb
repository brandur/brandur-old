class BooksController < ApplicationController
  def index
    @books = Book.all

    respond_to do |format|
      format.html
      format.json { render :json => @books }
    end
  end

  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => @book }
    end
  end
end
