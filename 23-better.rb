
require 'benchmark'
require 'set'

puts ""
puts "ProjectEuler Problem 23"
puts ""

# Every number over this LIMIT can be expressed as the sum of two abundant numbers
LIMIT = 28123

# Let's patch the numbers ...
class Fixnum
  # All divisors of the number
  def divisors
    divs = [1]
    i = 2
    top = self**(0.5)
    while i <= top
      divs << i if self % i == 0 and not divs.include?(i)
      divs << (self/i) if self % i == 0 and not divs.include?(self/i)
      i = i + 1
    end    
    divs
  end

  # A number is abundant if the sum of its divisors is greater than itself
  def abundant?
    divisors.reduce(:+) > self
  end

  # true if the number can be expressed as the sum of two elements in the 'set'
  def sum_of_two?(set)
    set.any? { |x| set.include?(self-x) }
  end
end

ans = nil

# Now get to work ...
total_time = Benchmark.realtime do
  # We find every abundant number under 'LIMIT'
  puts "Finding every abundant number under #{LIMIT} ... "
  abundants = (1..LIMIT).select { |n| n.abundant? }.to_set
  # We filter the numbers that can not be expressed as the sum of two abundant numbers
  puts "Filtering ... "
  filtered = (1..LIMIT).reject { |n| n.sum_of_two?(abundants) }
  # Sum the results
  puts "Calculating sum ... "
  ans = filtered.reduce(:+)
end

puts ""
puts "Solution found: #{ans}" if ans
puts "No solution found" if not ans
puts "Time elapsed: #{total_time*1000} ms"