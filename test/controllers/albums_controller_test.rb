require 'test_helper'

class AlbumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @albums = {
      one: albums(:one),
      two: albums(:two)
    }

    @users = {
      admin: users(:admin),
      one: users(:one),
      two: users(:two)
    }
  end

  test "get index" do
    get albums_path
    assert_response :success
  end

  test "get show" do
    get album_path(@albums[:one])
    assert_response :success
  end

  test "get new for admins only" do
    get new_album_url
    assert_response :redirect
    assert_redirected_to albums_path

    login_as @users[:one]
    get new_album_url
    assert_response :redirect
    assert_redirected_to albums_path

    login_as @users[:admin]
    get new_album_url
    assert_response :success
  end
end
