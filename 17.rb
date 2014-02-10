charNums = {
  0 => "",
  1 => "one",
  2 => "two",
  3 => "three",
  4 => "four",
  5 => "five",
  6 => "six",
  7 => "seven",
  8 => "eight",
  9 => "nine",
  10 => "ten",
  11 => "eleven",
  12 => "twelve",
  13 => "thirteen",
  14 => "fourteen",
  15 => "fifteen",
  16 => "sixteen",
  17 => "seventeen",
  18 => "eighteen",
  19 => "nineteen",
  20 => "twenty",
  30 => "thirty",
  40 => "forty",
  50 => "fifty",
  60 => "sixty",
  70 => "seventy",
  80 => "eighty",
  90 => "ninety",
  100 => "onehundred",
  200 => "twohundred",
  300 => "threehundred",
  400 => "fourhundred",
  500 => "fivehundred",
  600 => "sixhundred",
  700 => "sevenhundred",
  800 => "eighthundred",
  900 => "ninehundred",
  1000 => "onethousand"
}

=begin
class String
  alias_method :old_add, :+
  def +(other)
    self.old_add("\n").old_add(other)
  end
end
=end
  

p = (1..1000).inject("") do |t,i|
  case i
  when 1...21
    t + charNums[i]
  when 21...100
    t + charNums[i.to_s[0].to_i*10] + charNums[i.to_s[1].to_i]
  when 100...1000
    if i.to_s[1].to_i == 1
      tensValue = charNums[i.to_s[1].to_i*10 + i.to_s[2].to_i]
    else
      tensValue = charNums[i.to_s[1].to_i*10] + \
      charNums[i.to_s[2].to_i]
    end
    
    andValue = (i%100 == 0) ? "" : "and"
    
    t + charNums[i.to_s[0].to_i*100] + \
    andValue + \
    tensValue
    
  when 1000
    t + charNums[i]
  end
end

print p.size