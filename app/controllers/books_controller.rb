class BooksController < ApplicationController
  caches_page :index, :get
  cache_sweeper :book_sweeper

  def index
    @books = Book.all

    respond_to do |format|
      format.html
      format.json { render :json => @books }
    end
  end

  def show
    @book = Book.find(params[:id])
    @order = Book.where('finished_at < ?', @book.finished_at).where('finished_at > ?', @book.finished_at.year).count + 1

    respond_to do |format|
      format.html
      format.json { render :json => @book }
    end
  end
end
