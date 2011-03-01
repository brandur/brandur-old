require 'rss'

class Tweet < ActiveRecord::Base
  validates_presence_of :content, :link, :published_at
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

  def content_html
    html = content
    # links like protocol://link
    html = html.gsub /(^|[\n ])([\w]+?:\/\/[\w]+[^ "\n\r\t< ]*)/, '\1<a href="\2">\2</a>'
    # links like www.link.com or ftp.link.com
    html = html.gsub /(^|[\n ])((www|ftp)\.[^ "\t\n\r< ]*)/, '\1<a href="http://\2">\2</a>'
    # user links (like @fyrerise)
    html = html.gsub /@(\w+)/, '<a href="http://www.twitter.com/\1">@\1</a>'
    # hash tag search (like #mix11)
    html = html.gsub /#(\w+)/, '<a href="http://search.twitter.com/search?q=\1">#\1</a>'
  end
end
