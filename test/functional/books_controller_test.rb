require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  setup do
    @book = books(:towers_of_midnight)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:books)
  end

  test "should show book" do
    get :show, :id => @book.to_param
    assert_response :success
  end
end
