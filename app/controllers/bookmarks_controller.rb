class BookmarksController < ApplicationController
  def create(bookmark)
    bookmark.save!
    expire_page '/'
  end
end
