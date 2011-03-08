class BooksController < ApplicationController
  caches_page :index, :show
  cache_sweeper :book_sweeper

  def index
    @books = Book.all

    respond_to do |format|
      format.html
      format.json { render :json => @books }
    end
  end

  def show
    @book = Book.find_by_permalink(params[:id])
    @order = Book.where('finished_at < ?', @book.finished_at).where('finished_at > ?', @book.finished_at.year).count + 1

    respond_to do |format|
      format.html
      format.json { render :json => @book }
    end
  end

  def update(paths)
    paths.each do |path|
      book = Book.new YAML.load_file(path)
      existing_book = Book.find_by_permalink(book.permalink)
      book = if existing_book
        existing_book.attributes = book.attributes
        existing_book
      else
        book
      end
      book.save!
      $stdout.puts "\t[ok] Saved #{path}"
      expire_page "/books/#{book.permalink}"
    end
    expire_page '/'
    expire_page '/books'
  end
end
