class Book < ActiveRecord::Base
  validates_presence_of :title, :author, :finished_at
  validates_inclusion_of :rating, :in => 0..10, :message => 'rating must be between 1 and 10'

  default_scope order('finished_at DESC')

  def review_html
    RDiscount.new(review).to_html
  end

  def synopsis_html
    RDiscount.new(synopsis).to_html
  end
end
