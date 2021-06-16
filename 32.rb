# We shall say that an n-digit number is pandigital if it makes use
# of all the digits 1 to n exactly once;
# for example, the 5-digit number, 15234, is 1 through 5 pandigital.
#
# The product 7254 is unusual, as the identity, 39 × 186 = 7254,
# containing multiplicand, multiplier, and product is 1 through 9 pandigital.
#
# Find the sum of all products whose multiplicand/multiplier/product identity
# can be written as a 1 through 9 pandigital.
#
# HINT: Some products can be obtained in more than one way so
# be sure to only include it once in your sum.
#

products = []

def is_pandigital_product?(mc, m)
  [(mc * m), mc, m].map(&:to_s).inject(:+).split('').sort.join == [*1..9].join
end

(1..9876).each do |mc|
  (1..9876).each do |m|
    # largest 4 digit with no repeats. if we knew more we could optimize
    break if (m * mc > 9876) || m == mc
    products << m*mc if is_pandigital_product?(mc, m)
  end
end

puts "Answer: #{products.uniq.inject(:+)}"
#puts "Products: #{products}"
