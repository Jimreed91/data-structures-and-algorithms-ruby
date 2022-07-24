require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_reader :size

  def initialize
    @head = nil
    @size = 0
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      tail.next_node = Node.new(value)
    end
    @size += 1
  end

  def prepend(value)
    @head = Node.new(value, @head)
    @size += 1
  end

  def tail(node = @head)
    return node if node.next_node.nil?

    tail(node.next_node)
  end

  def at(index, node = @head, counter = 0)
    return node if counter == index

    at(index, node.next_node, counter + 1)
  end

  def pop
    if @size == 1
      node = @head
      @head = nil
      node
    end

    node = at(@size - 1)
    at(size - 2).next_node = nil
    @size -= 1
    node
  end

  def contains?(value, node = @head)
    return true if value == node.value
    return false if node.next_node.nil?

    contains?(value, node.next_node)
  end

  def find(value, node = @head, index = 0)
    return index if node.value == value
    return nil if node.next_node.nil?

    find(value, node.next_node, index + 1)
  end

  def to_s(node = @head, str = '')
    str += "(#{node.value}) -> "
    return str += 'nil' if node.next_node.nil?

    to_s(node.next_node, str)
  end
end

test_list = LinkedList.new
test_list.append(5)
test_list.append(10)
test_list.append(12)
test_list.prepend(3)
test_list.pop
test_list.pop
puts test_list.to_s
