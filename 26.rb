require 'prime'

class Fixnum
  # mathematical identity found online (10^i - 1) % n = 0 gives repeating decimals
  def dec_reps
    (1..self).each { |i| return i if 10 ** i % self == 1 }
    0
  end
end

# start with zero, so index matches the "divisor"
# only check primes. anything non-prime could break down further
# note to self: max return array, just get need index part
puts (0...1000).map { |m| (m.prime?) ? m.dec_reps : 0 }.each_with_index.max[1]

#older sloppy way, just to get answer out
=begin
# all non-primes could be broken down further, so only check primes
a = (1..1000).select{ |s| s.prime? }
max = 0
key = nil
a.each do |i|
  d = i.dec_reps
  if d > max
    max = d
    key = i
  end
end
puts "#{key} (#{max} cycles}"
=end
