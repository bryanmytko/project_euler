class Fixnum

 def divisors
    d = Array.new
    top = self**(0.5)
    (2..top+1).each do |i|
      if self % i == 0
        d.push i
        d.push (self / i)
      end
    end
    d.uniq
  end

  def is_abundant?
    if self == 2 then return false end
    divisors.uniq.inject(0){ |t,x| t + x } > self
  end

end
