require 'rss'

class Tweet < ActiveRecord::Base
  validates_uniqueness_of :link

  default_scope :order => 'published_at DESC'

  def self.update
    rss = RSS::Parser.parse(open('http://twitter.com/statuses/user_timeline/22980330.rss').read, false)
    rss.items.each do |i|
      # Time gets stored in UTC
      tweet = Tweet.new :content => i.title.gsub(/^[^:]+: /, ''), :link => i.link, :published_at => Time.parse(i.date.to_s)
      tweet.save if tweet.valid?
    end
  end
end
