require 'rss'

class Article < ActiveRecord::Base
  validates_presence_of :title, :permalink, :published_at
  validates_uniqueness_of :permalink

  default_scope :order => 'published_at DESC'

  def self.update
    feed = RSS::Parser.parse(open('http://mutelight.org/atom.xml').read, false)
    feed.entries.each do |a|
      # Time gets stored in UTC
      article = Article.new :title => a.title.content, :permalink => a.link.href, :published_at => Time.parse(a.published.content.to_s)
      article.save if article.valid?
    end
  end
end
