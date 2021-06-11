MAX = 9**5 * 6 # (9**6 * 6) is 7 digits so this must be our limit
range = 2..MAX
power = 5

found = []

range.each do |x|
  nums = x.to_s.chars.map(&:to_i)
  found << x if x === nums.map { |n| n**power }.inject(:+)
end

puts found.inject(:+)
