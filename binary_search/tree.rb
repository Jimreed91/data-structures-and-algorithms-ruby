require_relative 'node'

class Tree
  def initialize (arr)
    @root = build_tree(prep_array(arr))
  end

  def build_tree(arr, first = 0, last = arr.length)
    mid = arr/2


  end

  def prep_array(arr)
    arr.sort.uniq
  end

end

[1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
