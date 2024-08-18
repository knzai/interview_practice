# frozen_string_literal: true

require 'test/unit'
require './example'

# rubocop:disable Style/Documentation
class MyTest < Test::Unit::TestCase
  def test_my_function
    assert_equal(1, my_function)
  end
end
# rubocop:enable Style/Documentation
