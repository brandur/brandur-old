class Book < ActiveRecord::Base
  before_validation :build_permalink

  validates_presence_of :title, :author, :finished_at
  validates_inclusion_of :rating, :in => 0..10, :message => 'rating must be between 1 and 10'
  validates_uniqueness_of :permalink

  default_scope order('finished_at DESC')

  def review_html
    RDiscount.new(review).to_html
  end

  def synopsis_html
    RDiscount.new(synopsis).to_html
  end

  def to_param
    self.permalink
  end

  private

  def build_permalink
    self.permalink = title.parameterize
  end
end
