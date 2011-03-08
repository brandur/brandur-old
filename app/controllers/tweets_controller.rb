require 'rss'

class TweetsController < ApplicationController
  def update
    rss = RSS::Parser.parse(open('http://twitter.com/statuses/user_timeline/22980330.rss').read, false)
    rss.items.each do |i|
      # Time gets stored in UTC
      tweet = Tweet.new :content => i.title.gsub(/^[^:]+: /, ''), :permalink => i.link, :published_at => Time.parse(i.date.to_s)
      if tweet.valid?
        tweet.save
        expire_page '/'
      end
    end
  end
end
