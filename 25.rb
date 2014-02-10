#Fibonacci Array method. Wrote it before realizing it was not useful here.
class Array
  def fib!(max)
    a = [1, 1]
    tmp = 0
    i = 2
    prev = cur = 1 
    while i < max
      tmp = prev + cur
      prev = cur
      cur = tmp
      self.push tmp
      i = i + 1
    end
    a + self
  end
end

#Actual Solution
i = 3 
prev = cur = tmp = 1
puts "Searching..."  
while true
  tmp = prev + cur
  prev = cur
  cur = tmp
  if tmp.to_s.length == 1000
    puts "Answer Found #{i}: #{tmp}"
    break
  end
  i += 1
end
