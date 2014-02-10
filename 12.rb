def num_divisors(i)
  div = 0
  (1..Math.sqrt(i)).each do |x|
    div += 2 if i%x == 0
  end
  div
end

i = 1

while true do
  tri_num = i.downto(1).inject(:+)
  if num_divisors(tri_num) > 500
    puts tri_num
    break
  else i += 1
  end
end