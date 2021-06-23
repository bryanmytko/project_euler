# The number, 197, is called a circular prime because all rotations of the digits:
# 197, 971, and 719, are themselves prime.
#
# There are thirteen such primes below 100:
# 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
#
# How many circular primes are there below one million?
#

require "prime"
require "benchmark"

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

# We start with 2 so we can filter any other integer that contains an even number
# This reduces time from ~8s to 1.5s
found = [2]

Benchmark.bm do |b|
  b.report do
    (3..1000000)
      .reject { |r| r.to_s.split('').map(&:to_i).any? { |i| i % 2 == 0 }}
      .each do |digit|
        next unless Prime.prime? digit

        digit_array = digit.to_a

        next unless digit_array.each_with_index do |d, i|
          break unless Prime.prime? digit_array.rotate(i).join.to_i
        end

        found << digit
      end
  end
end

puts "Answer: #{found.length}"
