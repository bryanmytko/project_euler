#Euler published the remarkable quadratic formula:
#
#n² + n + 41
#
#It turns out that the formula will produce 40 primes for the consecutive values n = 0 to 39. However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41, and certainly when n = 41, 41² + 41 + 41 is clearly divisible by 41.
#
#Using computers, the incredible formula  n²  79n + 1601 was discovered, which produces 80 primes for the consecutive values n = 0 to 79. The product of the coefficients, 79 and 1601, is 126479.
#
#Considering quadratics of the form:
#
#n² + an + b, where |a|  1000 and |b|  1000
#
#where |n| is the modulus/absolute value of n
#e.g. |11| = 11 and |4| = 4
#Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n = 0.k


#prime class from xkcd - MUST FASTER
class Fixnum
  def prime?
    if self <2
      return false
    elsif self < 4
      return true
    elsif self % 2 == 0
      return false
    elsif self < 9
      return true
    elsif self % 3 == 0
      return false
    else
      r = (self**0.5).floor
      f = 5
      f.step r,6 do |g|
        if self % g == 0
          return false
        end
        if self % (g + 2) == 0
          return false
        end
      end
      return true
    end
  end
end

t = Time.now
primes = Array.new
max_primes = [0,0,0] 

(-1000..1000).each do |a|
  (-1000..1000).each do |b|
    if b.prime? 
      n,cur = 0,2
      primes.clear
      while cur.prime?
        cur = n**2 + a*n + b 
        primes.push cur
        n += 1
      end
      if primes.size > max_primes[2]
        max_primes[2] = primes.size
        max_primes = [a,b,primes.size]
      end
    end
  end
end

puts "Answer: #{max_primes[0] * max_primes[1]}"
puts "(time: #{(Time.now - t).round(2)}s)"
