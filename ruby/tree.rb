class Tree
  include Enumerable

  attr_accessor :children, :value, :traversal

  def self.new(value, *children)
    value.is_a?(Tree) ? value : super(value, *children)
  end

  def initialize(value, *children)
    @children = *children.map { |c| Tree.new(c) }
    @value = value
  end

  def inspect
    if children.empty?
      value.to_s
    else
      "#{value}: [#{children.map(&:inspect).join(', ')}]"
    end
  end

  def each(traversal=:depth, &block)
    case traversal
    when :depth
      depth(&block)
    when :breadth
      breadth(&block)
    else
      raise "Why don't *you* implement #{traversal} traversal"
    end
  end

  def depth(&block)
    return enum_for(:depth) unless block_given?
    yield self
    children.each { |c| c.each(&block) }
  end

  def breadth
    return enum_for(:breadth) unless block_given?
    stack = [self]
    while current = stack.shift do 
      yield current
      stack.push *current.children
    end
  end
end