def divisors_sum(num)
  sum = num.downto(1).select do |n|
    num != n && num % n == 0
  end
  sum.inject(&:+)
end

total_sum = 0

(2..10000).each do |i|
  divSum = divisors_sum(i)
  if(divSum > i)
    if divisors_sum(divSum) == i
      puts "#{i} / #{divSum}"
      total_sum += i + divSum
    end
  end
end
    
puts total_sum
