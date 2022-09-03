require_relative 'node'
require 'pry-byebug'
class Tree
  attr_reader :root
  def initialize(arr)
    @root = build_tree(prep_array(arr))
  end
  #Tree setup
  def build_tree(arr, first = 0, last = arr.length - 1)
    return nil if first > last

    mid = (first + last) / 2
    root_node = Node.new(arr[mid])

    root_node.left = build_tree(arr, first, mid - 1)
    root_node.right = build_tree(arr, mid + 1, last)
    return root_node
  end

  def prep_array(arr)
    out = arr.sort.uniq
    out
  end
  #Tree setup

  # Node insertion
  def insert(value, node = @root)
    return nil if node.data == value
    value < node.data ? insert_left(value, node) : insert_right(value, node)
  end

  def insert_left(value, node)
    node.left.nil? ?  node.left = Node.new(value) : insert(value, node.left)
  end

  def insert_right(value, node)
    node.right.nil? ?  node.right = Node.new(value) : insert(value, node.right)
  end
  # Node insertion

  def delete(value, node = @root)
    return node if node.nil?

    if node > value
      node.left = delete(value, node.left)
    elsif node < value
      node.right = delete(value, node.right)
    else
      if node.left.nil?
        return node.right
      elsif node.right.nil?
        return node.left
      end

    smallest_inorder(node.right)

    end
    node
  end

  def smallest_inorder(node)
    return node if node.left.nil?
    smallest_unorder(node.left)
  end

  def find(num)


  end

end

# pretty_print([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
# #  pretty_print(left.root)
# def pretty_print(node = @root, prefix = '', is_left = true)
#   pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
#   puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
#   pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
# end
