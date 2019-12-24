require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  def setup
    @pictures = {
      one: pictures(:one),
      two: pictures(:two)
    }

    @characters = {
      one: characters(:one),
      two: characters(:two),
      three: characters(:three)
    }

    # Order by pictures, then characters
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
  end

  test "coordinate pair must be present" do
    @locations[:one][:one].x_coord = nil
    @locations[:one][:one].y_coord = nil
    assert_not @locations[:one][:one].valid?
  end

  test "coordinate pair must be locally unique" do
    @locations[:one][:one].x_coord = @locations[:one][:two].x_coord
    @locations[:one][:one].y_coord = @locations[:one][:two].y_coord
    assert_not @locations[:one][:one].valid?
  end

  test "coordinate pair isn't globally unique" do
    @locations[:one][:one].x_coord = @locations[:two][:two].x_coord
    @locations[:one][:one].y_coord = @locations[:two][:two].y_coord
    assert_not @locations[:one][:one].valid?
  end

  test "returns both coordinates with attr_getter" do
    coords = @locations[:one][:one].coords
    assert coords == [@locations[:one][:one].x_coord, @locations[:one][:one].y_coord]
  end

  test "sets both coordinates with attr_setter" do
    coords = [5, 5]
    @locations[:one][:one].coords = coords
    assert coords == [@locations[:one][:one].x_coord, @locations[:one][:one].y_coord]
  end
end
