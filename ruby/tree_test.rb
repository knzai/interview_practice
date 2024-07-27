require 'test/unit'
require './tree'

class MyTest < Test::Unit::TestCase
  def setup
    @tree = Tree.new(1, Tree.new(2, Tree.new(4, 8), 5), Tree.new(3, 6, 7))
  end

  def test_inspect
    assert_equal "1: [2: [4: [8], 5], 3: [6, 7]]", @tree.inspect
  end

  def test_depth_and_default_each
    depth = [1, 2, 4, 8, 5, 3, 6, 7]
    assert_equal depth, @tree.map(&:value)
    assert_equal depth, @tree.each.map(&:value)
    assert_equal depth, @tree.each(:depth).map(&:value)
  end

  def test_breadth
    breadth = [1, 2, 3, 4, 5, 6, 7, 8]
    assert_equal breadth, @tree.breadth.map(&:value)
    assert_equal breadth, @tree.each(:breadth).map(&:value)
  end
end