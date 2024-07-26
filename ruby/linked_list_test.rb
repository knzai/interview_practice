require 'test/unit'
require "./linked_list"

class LinkedListTest < Test::Unit::TestCase

  def setup
    @node = Node.new("foo")
    @node.append("bar")
    @node2 = @node.next
  end


  def test_node_new
    node = Node.new "b"
    assert_equal "b", node.to_s

    node2 = Node.new "a", node
    assert_equal "b", node2.next.to_s
  end


  def test_push
    @node.push "really?"
    assert_equal "really?", @node.to_s
    assert_equal "foo", @node.next.to_s
  end

  def test_pop
    popped = @node.pop
    assert_equal "foo", popped
    assert_equal "bar", @node.pop
    assert_nil @node.pop
  end

  def test_apend
    @node.append "baz"
    assert_equal "foo", @node.pop
    assert_equal "bar", @node.pop
    assert_equal "baz", @node.pop
  end

  def test_unshift
    assert_equal "bar", @node.unshift
    assert_equal "foo", @node.unshift
    assert_nil @node.unshift
  end

  def test_map
    assert_equal @node.map(&:peek), ["foo", "bar"]
  end

  def test_to_s
    assert_equal "foo", @node.to_s
  end

end