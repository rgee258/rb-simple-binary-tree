class Node

	attr_accessor :value, :parent, :left_child, :right_child

	def initialize(value = nil, parent = nil)
		@value = value
		@parent = parent
		@left_child = nil
		@right_child = nil
	end

end