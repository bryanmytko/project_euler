@pyramids = { 
  0 => %w(75),
  1 => %w(95 64),
  2 => %w(17 47 82),
  3 => %w(18 35 87 10),
  4 => %w(20 04 82 47 65),
  5 => %w(19 01 23 75 03 34),
  6 => %w(88 02 77 73 07 63 67),
  7 => %w(99 65 04 28 06 16 70 92),
  8 => %w(41 41 26 56 83 40 80 70 33),
  9 => %w(41 48 72 33 47 32 37 16 94 29),
  10 => %w(53 71 44 65 25 43 91 52 97 51 14),
  11 => %w(70 11 33 28 77 73 17 78 39 68 17 57),
  12 => %w(91 71 52 38 17 14 91 43 58 50 27 29 48),
  13 => %w(63 66 04 68 89 53 67 30 73 16 69 87 40 31),
  14 => %w(04 62 98 27 23 09 70 98 73 93 38 53 60 04 23)
  }
  
def transverse(cur_row,cur_value)
  a = @pyramids[cur_row + 1][cur_value]
  b = @pyramids[cur_row + 1][cur_value + 1]
  if(a > b)
    return @pyramids[cur_row + 1].index(a)
  else
    return @pyramids[cur_row + 1].index(b)
  end
end


# This transverses paths based on comparisons. Doesn't yield the correct answer, but work off this idea.
sum = 0

(0..14).inject(2) do |t,r|
  puts "#{@pyramids[r][t].to_i}"
  sum += @pyramids[r][t].to_i
  transverse(r,t) unless r == 14
end

puts sum
  