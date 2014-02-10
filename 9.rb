#A Pythagorean triplet is a set of three natural numbers, a  b  c, for which, a^2 + b^2 = c^2
#For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
#There exists exactly one Pythagorean triplet for which a + b + c = 1000.
#Find the product abc.
(1..1000).each do |a|
  (a..1000).each do |b|
    if 1000000 + 2*(a * b) - 2000*(a + b) == 0
      c = Math.sqrt((a*a) + (b*b)).to_i
      puts "Found it. #{a},#{b},#{c} => #{a*b*c}"
    end
  end
end

#Brute force way... takes forever
=begin 
(b..1000).each do |c|
  if (a*a) + (b*b) == (c*c)
    if a + b + c == 1000
      puts "Found it. #{a} * #{b} * #{c} => #{a*b*c}"
    end
  end
end
=end 