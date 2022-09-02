require_relative 'node'
require_relative 'tree'

[1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

tree = Tree.new([1, 7, 4, 23, 8, 9,])

p tree
binding.pry
puts tree
tree.insert(60)

p tree
