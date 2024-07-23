require "minitest/autorun"
require "./example"

class MyTest < Minitest::Test
  def test_my_function
      assert_equal(1, my_function)
  end
end