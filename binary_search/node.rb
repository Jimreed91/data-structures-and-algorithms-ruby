class Node
  include Comparable
attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    left
    right
  end

  def <=>(other)
    @data <=> other
  end
end
