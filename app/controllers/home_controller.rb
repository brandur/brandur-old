class HomeController < ApplicationController
  caches_page :index

  def index
    @photos = Photo.limit(10)
    @articles = Article.limit(5)
    @tweets = Tweet.limit(10)
  end

  def sandbox
  end
end
