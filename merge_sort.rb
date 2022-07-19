require 'benchmark'
class MergeSort
  def self.sort(arr)
    # Base case is a single digit array
    return arr if arr.length < 2

    # Array is divided in half recursively
    middle = (arr.length / 2.0).ceil
    left_part = sort(arr[0...middle])
    right_part = sort(arr[middle..arr.length])

    merge(left_part, right_part)
  end

  def self.merge(left_arr, right_arr, merged = [])
    until left_arr.empty? && right_arr.empty?
      # If one side is empty the other one has to be next in sequence
      return merged + right_arr if left_arr.empty?
      return merged + left_arr if right_arr.empty?

      merged << (left_arr[0] <= right_arr[0] ? left_arr.shift : right_arr.shift)
    end
    merged
  end
end

test_list = Array.new(43) { rand(1..99) }

p MergeSort.sort(test_list)
# Testing speed
# test_list = Array.new(42000){rand(1..99999)}

# Benchmark.bm do |x|
#   x.report('Merge sort') { merge_sort(test_list) }
#   x.report('.sort') { test_list.sort }
# end
