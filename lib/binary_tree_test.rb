require "./binary_tree"

# Set up binary tree with sorted array
sorted_test = BinaryTree.new()
sorted_test.build_tree_from_sorted([5, 11, 12, 14, 15, 18, 19, 21, 23, 25, 27, 28, 30, 32, 37, 41, 45])
puts "Sorted root: #{sorted_test.root.value}"

# Test binary tree using sorted data with BFS
sorted_root = sorted_test.root
sorted_queue = [sorted_root]
sorted_depth = 0
while (!sorted_queue.empty?) do
	sorted_curr = sorted_queue.shift
	sorted_queue.push(sorted_curr.left_child) if !sorted_curr.left_child.nil?
	sorted_queue.push(sorted_curr.right_child) if !sorted_curr.right_child.nil?
	puts "Depth #{sorted_depth}: #{sorted_curr.value}"
	sorted_depth += 1 if sorted_queue.length >= 1 && sorted_curr.value > sorted_queue[0].value
end

# Set up binary tree with unsorted array
unsorted_test = BinaryTree.new()
unsorted_test.build_tree([10, 7, 14, 20, 1, 5, 8])
puts "\nUnsorted root: #{unsorted_test.root.value}"

# Test binary tree using unsorted data with BFS
unsorted_root = unsorted_test.root
unsorted_queue = [unsorted_root]
unsorted_depth = 0
while (!unsorted_queue.empty?) do
	unsorted_curr = unsorted_queue.shift
	unsorted_queue.push(unsorted_curr.left_child) if !unsorted_curr.left_child.nil?
	unsorted_queue.push(unsorted_curr.right_child) if !unsorted_curr.right_child.nil?
	puts "Depth #{unsorted_depth}: #{unsorted_curr.value}"
	unsorted_depth += 1 if unsorted_queue.length >= 1 && unsorted_curr.value > unsorted_queue[0].value
end

# BFS with sorted array
puts "\nBFS"
puts "Sorted array node with value 12 found at: #{sorted_test.breadth_first_search(30)}"
puts "Sorted array node with value 41 found at: #{sorted_test.breadth_first_search(41)}"
puts "Sorted array node with value 29 (nil expected) found at: #{sorted_test.breadth_first_search(29)}"

# BFS with unsorted array
puts "Unsorted array node with value 20 found at: #{unsorted_test.breadth_first_search(20)}"
puts "Unsorted array node with value 5 found at: #{unsorted_test.breadth_first_search(5)}"
puts "Unsorted array node with value 29 (nil expected) found at: #{unsorted_test.breadth_first_search(29)}"

# DFS with sorted array
puts "\nDFS"
puts "Sorted array node with value 12 found at: #{sorted_test.depth_first_search(30)}"
puts "Sorted array node with value 41 found at: #{sorted_test.depth_first_search(41)}"
puts "Sorted array node with value 29 (nil expected) found at: #{sorted_test.depth_first_search(29)}"

# DFS with unsorted array
puts "Unsorted array node with value 20 found at: #{unsorted_test.depth_first_search(20)}"
puts "Unsorted array node with value 5 found at: #{unsorted_test.depth_first_search(5)}"
puts "Unsorted array node with value 29 (nil expected) found at: #{unsorted_test.depth_first_search(29)}"

# Recursive DFS with sorted array
puts "\nRecursive DFS"
puts "Sorted array node with value 12 found at: #{sorted_test.dfs_rec(30)}"
puts "Sorted array node with value 41 found at: #{sorted_test.dfs_rec(41)}"
puts "Sorted array node with value 29 (nil expected) found at: #{sorted_test.dfs_rec(29)}"

# Recursive DFS with unsorted array
puts "Unsorted array node with value 20 found at: #{unsorted_test.dfs_rec(20)}"
puts "Unsorted array node with value 5 found at: #{unsorted_test.dfs_rec(5)}"
puts "Unsorted array node with value 29 (nil expected) found at: #{unsorted_test.dfs_rec(29)}"