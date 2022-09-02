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
  # Node delete
  def delete(value, node = @root)
    return node if node.nil?

    if node > value
      node.left = delete(value, node.left)
    elsif node < value
      node.right = delete(value, node.right)
    else
      # If target has no children or one child
      return node.right if node.left.nil?

      return node.left if node.right.nil?

      # If target has two child nodes
      # Copy the data from the next largest node to the target node and delete next largest node
      node.data = smallest_inorder(node.right)
      delete(node.data, node.right)
    end
    node
  end

  def smallest_inorder(node)
    return node.data if node.left.nil?

    smallest_inorder(node.left)
  end
  # Node Delete

  def find(num, node = @root)
    return node if num == node

    node > num ? find(num, node.left) : find(num, node.right)
  end

end
