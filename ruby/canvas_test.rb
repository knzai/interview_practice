# frozen_string_literal: true

require 'test/unit'
require './canvas'

# rubocop:disable Style/Documentation
class MyTest < Test::Unit::TestCase
  def setup
    @canvas = Canvas.new(8, 8)
  end


  def test_draw_horizontal
    @canvas.draw_horizontal(4)
    assert_equal "--------", @canvas[4].to_s
    #assert_equal(1, my_function)
  end

  def test_draw_vertical
    @canvas.draw_vertical(4)
    assert_equal " ", @canvas[0][3]
    assert_equal "|", @canvas[0][4]
    assert_equal "|", @canvas[1][4]


    

    #assert_equal(1, my_function)
  end
end
# rubocop:enable Style/Documentation
