def collatz(i)
  count = 0
  while i!=1
    if i%2 == 0
      i = i/2
    else
      i = 3*i + 1
    end
    count += 1
  end
  count
end

largest,largestStart = 0,0

(1...1000000).each do |i|
  current = collatz(i)
  if largest < current
    largest = current
    largestStart = i
  end
end

puts "#{largestStart} has the largest chain, with #{largest} terms."
  