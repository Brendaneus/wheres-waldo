require 'test_helper'

class PicturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @albums = {
      one: albums(:one),
      two: albums(:two)
    }

    @pictures = {
      one: {
        one: pictures(:one),
        two: pictures(:two)
      },
      two: {
        three: pictures(:three),
        four: pictures(:four)
      }
    }

    @users = {
      admin: users(:admin),
      one: users(:one),
      two: users(:two)
    }
  end

  test "get show" do
    get album_picture_path(@albums[:one], @pictures[:one][:one])
    assert_response :success
  end

  # test "get new for admins only" do
  #   get new_picture_path(@picture)
  #   assert_response 
  # end
end
