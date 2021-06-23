# The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.
#
# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2
#
# (Please note that the palindromic number, in either base, may not include leading zeros.)
#

# First pass: 
#
# found = []
#
# (1..1_000_000).each do |i|
#   str = i.to_s
#   bin = i.to_s(2)
#
#   found << i if (str == str.reverse) && (bin == bin.reverse)
# end
#
# puts "Answer: #{found.inject(:+)}"


# But... lol ruby
p (1..1_000_000).select { |i| (i.to_s == i.to_s.reverse) && (i.to_s(2) == i.to_s(2).reverse) }.inject(:+)
