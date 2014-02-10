# Summation of primes
# Problem 10
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.

def is_prime?(num)
  return false if num == 1
  return true if num == 2 
  (2..Math.sqrt(num)+1).each do |x|
    return false if num%x == 0
  end
  true
end

s = (1..2000000).inject(0) do |sum,x|
  if is_prime?(x)
    sum = sum + x
  else sum end
end

puts s

# Much faster version. Didn't know of the prime library.
=begin
require 'prime'
total = 0
Prime.each(2000000) { |p| total += p }
p total
=end
