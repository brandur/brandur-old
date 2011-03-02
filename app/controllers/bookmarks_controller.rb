class BookmarksController < ApplicationController
  def create(bookmark)
    bookmark.save!
    expire_page :controller => :home, :action => :index
  end
end
