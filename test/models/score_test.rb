require 'test_helper'

class ScoreTest < ActiveSupport::TestCase
  def setup
    @users = {
      one: users(:one),
      two: users(:two)
    }

    @scores = {
      one: {
        one: scores(:one_one),
        two: scores(:one_two)
      },
      two: {
        one: scores(:two_one),
        two: scores(:two_two)
      }
    }
  end

  # Nothing to test...
end
