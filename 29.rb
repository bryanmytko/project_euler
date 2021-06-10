a = 2..100
b = 2..100

s = []

a.each do |i|
  b.each do |j|
    s << i**j
  end
end

puts s.uniq.length
