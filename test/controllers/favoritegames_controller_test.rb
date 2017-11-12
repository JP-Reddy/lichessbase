require 'test_helper'

class FavoritegamesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get favoritegames_index_url
    assert_response :success
  end

  test "should get new" do
    get favoritegames_new_url
    assert_response :success
  end

  test "should get create" do
    get favoritegames_create_url
    assert_response :success
  end

  test "should get edit" do
    get favoritegames_edit_url
    assert_response :success
  end

  test "should get update" do
    get favoritegames_update_url
    assert_response :success
  end

  test "should get destroy" do
    get favoritegames_destroy_url
    assert_response :success
  end

end
