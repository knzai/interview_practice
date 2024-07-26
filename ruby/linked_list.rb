require 'forwardable'

class Node
	include Enumerable
	extend Forwardable

	attr_accessor :element, :link
	alias :peek :element
	alias :next :link

	def_delegator :@element, :to_s

	def initialize(element=nil, link=nil)
		@element, @link = element, link
	end

	def append(v)
		tap { @link = @link&.append(v) || Node.new(v) }
	end

	def unshift
	  l,s = reverse_each.first(2); l.element.tap { l.element = s&.link = nil }
	end

	def push(v)
		@link = Node.new(@element, @link).tap { @element = v }
	end

	def pop
		@element.tap { @element, @link= @link&.element, @link&.link }
	end

	def each(&b)
		yield(self); @link&.each(&b)
	end

	def inspect
    [@element, @link].inspect
  end
end