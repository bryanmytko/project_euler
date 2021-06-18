# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
#
# Find the sum of all numbers which are equal to the sum of the factorial of their digits.
#
# Note: As 1! = 1 and 2! = 2 are not sums they are not included.

# 2540161 works as an upper limit
# 9! * 7 = 7 digits vs 7 digit number 9999999
# 9! * 8 = 7 digits vs 8 digit number 99999999

require 'benchmark'

# found this online: https://coderwall.com/p/h2ixcg/converting-integer-to-array-with-ruby
# seems to be a bit faster than converting to a string and splitting
# real: 5.355145 -> real: 2.705866 
class Integer
  def to_a
    arr = []
    tmp = self
    while tmp>0
      arr << tmp%10
      tmp /= 10
    end
    arr.reverse
  end
end

found = []
cache = {}

# Benchmark.bm do |x|
#   x.report("factorial") do

(3..2540161).each do |d|
  digits = d.to_a # see monkey patch above
  # digits = d.to_s.split('').map(&:to_i) # this part is slow. takes around 3.5s on MBP

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
