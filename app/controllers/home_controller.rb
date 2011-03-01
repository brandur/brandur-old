class HomeController < ApplicationController
  caches_page :index

  def index
    @articles = Article.limit(5)
    @book = Book.first
    books = Book.all.group_by{ |b| b.finished_at.year }.collect{ |y, bs| { :year => y, :num_books => bs.count } }.sort_by{ |obj| obj[:year] }.reverse
    @book_years = books.collect{ |b| b[:year] }
    @book_year_counts = books.collect{ |b| b[:num_books] }
    @fact_days = 30.downto(0).collect{ |i| i.days.ago.strftime('%b %d') }
    @fact_day_counts = 30.downto(0).collect{ rand(10) }
    @photos = Photo.limit(16)
    @tweets = Tweet.limit(10)
  end

  def sandbox
  end
end
