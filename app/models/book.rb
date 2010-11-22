class Book < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :author
  validates_inclusion_of :rating, :in => 0..10, :message => 'rating must be between 1 and 10'
end
