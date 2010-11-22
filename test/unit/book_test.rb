require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "that that a book must have a title" do
    book = books(:towers_of_midnight)
    assert book.valid?
    book.title = nil
    assert book.invalid?
  end

  test "that that a book must have an author" do
    book = books(:towers_of_midnight)
    assert book.valid?
    book.author = nil
    assert book.invalid?
  end

  test "that that a book's rating must stay in a certain range" do
    book = books(:towers_of_midnight)
    book.rating = 11
    assert book.invalid?
    book.rating = 0
    assert book.valid?
    book.rating = 10
    assert book.valid?
  end
end
