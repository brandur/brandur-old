require 'rss'

class ArticlesController < ApplicationController
  def update
    feed = RSS::Parser.parse(open('http://mutelight.org/atom.xml').read, false)
    feed.entries.each do |a|
      # Time gets stored in UTC
      article = Article.new :title => a.title.content, :permalink => a.link.href, :published_at => Time.parse(a.published.content.to_s)
      if article.valid?
        article.save
        #expire_page :controller => :home, :action => :index
      end
    end
  end
end
