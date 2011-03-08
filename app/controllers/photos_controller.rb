require 'open-uri'
require 'xml'

class PhotosController < ApplicationController
  def update
    parser = XML::Parser.string open('http://api.flickr.com/services/feeds/photos_public.gne?id=8555926@N08&lang=en-us&format=rss_200').read
    doc = parser.parse
    doc.context.register_namespace('media', 'http://search.yahoo.com/mrss/')
    doc.find('//rss/channel/item').each do |i|
      photo = Photo.new :thumbnail_url => i.find('media:thumbnail').first['url'], :permalink => i.find('link').first.content, :published_at => Time.parse(i.find('pubDate').first.content)
      if photo.valid?
        photo.save
        #expire_page :controller => :home, :action => :index
      end
    end
  end
end
