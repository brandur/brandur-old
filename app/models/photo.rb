require 'open-uri'
require 'xml'

class Photo < ActiveRecord::Base
  validates_presence_of :thumbnail_url, :link, :published_at
  validates_uniqueness_of :link

  default_scope :order => 'published_at DESC'

  def self.update
    parser = XML::Parser.string open('http://api.flickr.com/services/feeds/photos_public.gne?id=8555926@N08&lang=en-us&format=rss_200').read
    doc = parser.parse
    doc.context.register_namespace('media', 'http://search.yahoo.com/mrss/')
    doc.find('//rss/channel/item').each do |i|
      photo = Photo.new :thumbnail_url => i.find('media:thumbnail').first['url'], :link => i.find('link').first.content, :published_at => Time.parse(i.find('pubDate').first.content)
      photo.save if photo.valid?
    end
    doc
  end
end
