require 'test/unit'
require "./linked_list"

class LinkedListTest < Test::Unit::TestCase

  def setup
    @node = Node.new
    @node.car = "foo"
    @node2 = Node.new
    @node2.car = "bar"
    @node.cdr = @node2
  end

  def test_node_raw
    assert_equal "foo", @node.car
    assert_equal "bar", @node.cdr.car
  end

    def test_node_new
      node = Node.new "b"
      assert_equal "b", node.car

      node2 = Node.new "a", node
      assert_equal "b", node2.cdr.car
    end


    def test_push
      @node.push "really?"
      assert_equal "really?", @node.car
      assert_equal "foo", @node.cdr.car
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

    def test_map
      assert_equal @node.map(&:peek), ["foo", "bar"]
    end

end