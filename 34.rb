# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
#
# Find the sum of all numbers which are equal to the sum of the factorial of their digits.
#
# Note: As 1! = 1 and 2! = 2 are not sums they are not included.

# 2540161 upper limit  9!7 because 9! * 8 is too big for any solution

require 'benchmark'

found = []
cache = {}

# Benchmark.bm do |x|
#   x.report("factorial") do

(3..2540161).each do |d|
  digits = d.to_s.split('').map(&:to_i) # this part is slow. takes around 3.5s on MBP

  # simple caching the factorials cuts time in half
  factorials = digits.map do |digit|
    if cache[digit]
      cache[digit]
    else
      cache[digit] = (1..digit).reduce(1, :*)
    end
  end

  found << d if factorials.inject(:+) == d
end

#   end
# end

p found

print "Answer: #{found.inject(:+)}"
