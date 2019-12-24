require 'test_helper'

class PictureTest < ActiveSupport::TestCase
  def setup
    @pictures = {
      one: pictures(:one),
      two: pictures(:two)
    }

    # Ordered by pictures, then characters
    @locations = {
      one: {
        one: locations(:one_one),
        two: locations(:one_two),
        three: locations(:one_three)
      },
      two: {
        one: locations(:two_one),
        two: locations(:two_two),
        three: locations(:two_three)
      }
    }

    # Ordered by pictures, then users
    @scores = {
      one: {
        one: scores(:one_one),
        two: scores(:two_one)
      },
      two: {
        one: scores(:one_two),
        two: scores(:two_two)
      }
    }
  end

  test "title must be present" do
    @pictures[:one].title = ''
    assert_not @pictures[:one].valid?
    @pictures[:one].title = '   '
    assert_not @pictures[:one].valid?
  end

  test "title must be unique (case-insensitive)" do
    @pictures[:one].title = @pictures[:two].title.upcase
    assert_not @pictures[:one].valid?
    @pictures[:one].title = @pictures[:two].title.downcase
    assert_not @pictures[:one].valid?
  end

  test "title length must not exceed 32 chars" do
    @pictures[:one].title = "X" * 32
    assert @pictures[:one].valid?
    @pictures[:one].title = "X" * 33
    assert_not @pictures[:one].valid?
  end

  test "locations must be dependent destroyed" do
    @pictures[:one].destroy
    
    @locations[:one].each_value do |location|
      assert_raise (ActiveRecord::RecordNotFound) { location.reload }
    end
  end

  test "scores must be dependent destroyed" do
    @pictures[:one].destroy

    @scores[:one].each_value do |score|
      assert_raise (ActiveRecord::RecordNotFound) { score.reload }
    end
  end
end
