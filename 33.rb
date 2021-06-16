# The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting
# to simplify it may incorrectly believe that 49/98 = 4/8,
# which is correct, is obtained by cancelling the 9s.
#
# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
#
# There are exactly four non-trivial examples of this type of fraction,
# less than one in value, and containing two digits in the numerator and denominator.
#
# If the product of these four fractions is given in its lowest common terms,
# find the value of the denominator.
#
solutions = []

def explode(int)
  int.to_s.split('').map(&:to_i)
end

(11..99).each do |d|
  (11..99).each do |n|
    # First pass. This can definitely be refactored
    darr = explode(d)
    narr = explode(n)

    set = darr & narr

    if !set.empty?
      new_d = darr - set
      new_n = narr - set

      break if new_d.empty? || new_n.empty?
      break if new_n.first == 0 || new_d.first == 0

      reduced = (darr - set).first.to_f / (narr - set).first.to_f
      solutions << { d: d, n: n } if reduced == d.to_f / n.to_f
    end
  end
end

print "Answer: #{solutions.map { |x| x[:d] }.inject(:*) / solutions.map { |x| x[:n] }.inject(:*)}"
