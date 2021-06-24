# The number 3797 has an interesting property.
# Being prime itself, it is possible to continuously remove digits from left to right,
# and remain prime at each stage: 3797, 797, 97, and 7.
#
# Similarly we can work from right to left: 3797, 379, 37, and 3.
#
# Find the sum of the only eleven primes that are both truncatable from left to right and right to left.
#
# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
require "prime"

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

def truncate?(n, direction)
  arr = n.to_a
  ops = {
    left: :shift,
    right: :pop,
  }

  return unless Prime.prime? n

  until arr.empty?
    return unless Prime.prime? arr.join.to_i
    arr.send(ops[direction])
  end

  true
end

(23..748317)
  .reject { |r| r % 2 == 0 }
  .each { |n| found << n if truncate?(n, :left) && truncate?(n, :right) }

print "Answer: #{found.inject(:+)}"
