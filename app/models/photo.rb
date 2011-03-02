class Photo < ActiveRecord::Base
  validates_presence_of :thumbnail_url, :permalink, :published_at
  validates_uniqueness_of :permalink

  default_scope :order => 'published_at DESC'
end
