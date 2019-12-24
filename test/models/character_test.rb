require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
  def setup
    @characters = {
      one: characters(:one),
      two: characters(:two),
      three: characters(:three)
    }

    # Ordered by characters, then pictures
    @locations = {
      one: {
        one: locations(:one_one),
        two: locations(:two_one),
      },
      two: {
        one: locations(:one_two),
        two: locations(:two_two),
      },
      three: {
        one: locations(:one_three),
        two: locations(:two_three)
      }
    }
  end

  test "name must be present" do
    @characters[:one].name = ''
    assert_not @characters[:one].valid?
    @characters[:one].name = '   '
    assert_not @characters[:one].valid?
  end

  test "name must be unique (case-insensitive)" do
    @characters[:one].name = @characters[:two].name.upcase
    assert_not @characters[:one].valid?
    @characters[:one].name = @characters[:two].name.downcase
    assert_not @characters[:one].valid?
  end

  test "locations must be dependent destroyed" do
    @characters[:one].destroy

    @locations[:one].each_value do |location|
      assert_raise (ActiveRecord::RecordNotFound) { location.reload }
    end
  end
end
