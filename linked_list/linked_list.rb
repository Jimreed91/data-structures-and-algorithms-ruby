require 'pry-byebug'
class LinkedList
  attr_accessor :head
  def initialize
    @head = nil
  end

  def append(value)
    if @head.nil?
      p @head = Node.new(value)
    else
      p tail.next_node = Node.new(value)
    end
  end


  def prepend(value)
    @head = Node.new(value, @head)
  end

  def size

  end

  def head
    return @head.value
  end

  def tail(node = @head)
    return node if node.next_node.nil?
    tail(node.next_node)
  end
end

class Node
  attr_accessor :next_node, :value
  def initialize(value = nil, next_node = nil)
    @next_node = next_node
    @value = value
  end

end

test_list = LinkedList.new
test_list.append(5)
test_list.append(10)

test_list.append(12)
test_list.prepend(3)
binding.pry
test_list.append(11)
