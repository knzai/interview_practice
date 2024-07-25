class Node
	include Enumerable

	attr_accessor :car, :cdr
	alias :peek :car

	def initialize(car=nil, cdr=nil)
		self.car = car
		self.cdr = cdr
	end


	def append(value)
		self.cdr = Node.new value
	end

	def append(value)
		if self.cdr
			self.cdr.append(value)
		else
			self.cdr = Node.new value
		end
	end

	def push(value)
		old_self = Node.new self.car, self.cdr
		self.car = value
		self.cdr = old_self
	end

	def pop
		value = self.car
		if next_node = self.cdr
			self.car = next_node.car
			self.cdr = next_node.cdr
		else
			self.car = nil
		end
		value
	end

	def each
		yield self
		current = self
		while current = current.cdr
			yield current
		end


		# if self.cdr
		# 	yield self.cdr.each
		# else
		# 	yield car
		# end
	end
end