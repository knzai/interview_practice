require 'forwardable'

class Node
	N = self
	self.singleton_class.send(:alias_method, :n, :new)
	
	include Enumerable
	extend Forwardable

	attr_accessor :h, :t
	alias :peek :h
	alias :next :t

	def_delegator :@h, :to_s

	def initialize(h=nil, t=nil)
		@h, @t = h, t
	end

	def append(v)
		tap { @t = @t&.append(v) || N.n(v) }
	end

	def unshift
	  l,s = reverse_each.first(2); l.h.tap { l.h = s&.t = nil }
	end

	def push(v)
		@t = N.n(@h, @t).tap { @h = v }
	end

	def pop
		@h.tap { @h, @t= @t&.h, @t&.t }
	end

	def each(&b)
		yield(self); @t&.each(&b)
	end

	def inspect
    [@h, @t].inspect
  end
end