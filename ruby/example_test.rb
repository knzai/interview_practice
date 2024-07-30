require 'test/unit'
require "./example"

class MyTest < Test::Unit::TestCase
  def test_my_function
      assert_equal(1, my_function)
  end
end