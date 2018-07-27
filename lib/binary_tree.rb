class BinaryTree

	require "./node"

	attr_reader :root

	def initialize
		@root = nil
	end

	def build_tree_from_sorted(data, start = 0, finish = data.length-1)
		if (start > finish)
			return nil
		end
		mid = ((start + finish) / 2).floor
		node = Node.new(data[mid])
		if (@root.nil?)
			@root = node
		end
		node.left_child = build_tree_from_sorted(data, start, mid-1)
		node.right_child = build_tree_from_sorted(data, mid+1, finish)
		node
	end

	def build_tree(data)
		if (@root.nil?)
			node = Node.new(data.shift)
			@root = node
		end
		data.each do |val|
			new_node = Node.new(val)
			curr = @root
			while (!curr.nil?) do
				if (new_node.value < curr.value)
					if (curr.left_child.nil?)
						curr.left_child = new_node
						break
					else
						curr = curr.left_child
					end
				else
					if (curr.right_child.nil?)
						curr.right_child = new_node
						break
					else
						curr = curr.right_child
					end
				end
			end
		end
	end

	def breadth_first_search(target)
		queue = [@root]
		while (!queue.empty?) do
			curr = queue.shift
			if (curr.value == target)
				return curr
			end
			queue.push(curr.left_child) if !curr.left_child.nil?
			queue.push(curr.right_child) if !curr.right_child.nil?
		end
		nil
	end

	def depth_first_search(target)
		stack = [@root]
		while (!stack.empty?) do
			curr = stack.pop
			if (curr.value == target)
				return curr
			end
			stack.push(curr.right_child) if !curr.right_child.nil?
			stack.push(curr.left_child) if !curr.left_child.nil?
		end
		nil
	end

	def dfs_rec(target, curr = @root)
		return curr if curr.value == target
		return nil if curr.value.nil?

		# Because the left_child recursion is not the last line, it is not implicitly returned, so we need to assign it to variables
		left = dfs_rec(target, curr.left_child) if !curr.left_child.nil?
		right = dfs_rec(target, curr.right_child) if !curr.right_child.nil?
		# Works the same as a logical OR, evaluating from left to right
		left or right
	end
end