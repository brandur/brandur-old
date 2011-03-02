class Bookmark < ActiveRecord::Base
  validates_presence_of :permalink, :title
  validates_uniqueness_of :permalink

  default_scope :order => 'created_at DESC'
end
