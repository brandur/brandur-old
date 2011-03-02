class HomeController < ApplicationController
  caches_page :index

  def index
    @articles = Article.limit(5)
    @book = Book.first
    books = Book.all.group_by{ |b| b.finished_at.year }.map{ |y, bs| { :year => y, :num_books => bs.count } }.sort_by{ |obj| obj[:year] }.reverse
    @book_stats = { :years => books.map{ |b| b[:year] },
                    :counts => books.map{ |b| b[:num_books] } }
    @bookmarks = Bookmark.limit(5)
    fact_stat = FactStat.first
    if fact_stat
      @fact_last_category = { :name => fact_stat.last_category_name, :slug => fact_stat.last_category_slug }
      facts_by_day = JSON.parse(fact_stat.facts_by_day)
      counts = 30.downto(0).map{ |i| facts_by_day[i.days.ago.to_date.iso8601] }.map{ |i| i.nil? ? 0 : i }
      @fact_stats = { :days => 30.downto(0).map{ |i| i.days.ago.strftime('%b %d') }, 
                      :counts => counts }
    end
    @photos = Photo.limit(16)
    @tweets = Tweet.limit(10)
  end

  def sandbox
  end
end
