class Fibonacci
  # non recursive method
  def self.generate(num)
    return [0] if num < 2

    arr = [0, 1]
    (num - 2).times { arr << (arr[-1] + arr[-2]) }
    arr
  end

  # recursive fibonacci
  def self.generate_recursively(num, arr = [0, 1])
    # base case
    return [0] if num < 1
    return arr if num <= 2

    generate_recursively(num - 1, arr << arr[-1] + arr[-2])
  end
end

p Fibonacci.generate(10)
p Fibonacci.generate_recursively(10)
