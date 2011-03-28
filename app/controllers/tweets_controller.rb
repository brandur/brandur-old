require 'rss'

class TweetsController < ApplicationController
  caches_page :index

  def index
    @tweets = Tweet.all
    @tweet_stats = Tweet.count_by('published_at', :group_by => 'month')
  end

  def update
    rss = RSS::Parser.parse(open('http://twitter.com/statuses/user_timeline/22980330.rss').read, false)
    rss.items.each do |i|
      # Time gets stored in UTC
      tweet = Tweet.new :content => i.title.gsub(/^[^:]+: /, ''), :permalink => i.link, :published_at => Time.parse(i.date.to_s)
      if tweet.valid?
        tweet.save
        expire_page '/'
        expire_page '/twitter'
      end
    end
  end
end
