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

# Refactor attempt:
#
# If the numbers 1 to 5 are written out in words:
# one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words,
# how many letters would be used?
#
# NOTE: Do not count spaces or hyphens.
# For example, 342 (three hundred and forty-two) contains 23 letters
# and 115 (one hundred and fifteen) contains 20 letters.
#
# The use of "and" when writing out numbers is in compliance with British usage.
# require "rspec"
#
# total = 0
#
# def int_to_word(n)
#   i2w = {
#     0 => nil,
#     1 =>  "one",
#     2 =>  "two",
#     3 =>  "three",
#     4 =>  "four",
#     5 =>  "five",
#     6 =>  "six",
#     7 =>  "seven",
#     8 =>  "eight",
#     9 =>  "nine",
#     10 => "ten",
#     11 => "eleven",
#     12 => "twelve",
#     13 => "thirteen",
#     14 => "fourteen",
#     15 => "fifteen",
#     16 => "sixteen",
#     17 => "seventeen",
#     18 => "eighteen",
#     19 => "nineteen",
#     20 => "twenty",
#     30 => "thirty",
#     40 => "forty",
#     50 => "fifty",
#     60 => "sixty",
#     70 => "seventy",
#     80 => "eighty",
#     90 => "ninety",
#     100 => "one hundred and",
#     200 => "two hundred and",
#     300 => "three hundred and",
#     400 => "four hundred and",
#     500 => "five hundred and",
#     600 => "six hundred and",
#     700 => "seven hundred and",
#     800 => "eight hundred and",
#     900 => "nine hundred and",
#     1000 => "one thousand",
#   }
#
#   p [i2w[n/100*100], i2w[n%100/10*10], i2w[n%10]]
#   [i2w[n/100*100], i2w[n%100/10*10], i2w[n%10]].compact.join(" ")
# end
#
# (1..1000).each do |n|
#   total += int_to_word(n).gsub(/[^a-z]/, "").length
# end
#
# print "Answer: #{total}"
#
# RSpec.describe "int to words" do
#   it "converts 1000" do
#     n = 1000
#
#     expect(int_to_word(n)).to eql("one thousand")
#   end
#
#   it "converts a three digit number" do
#     n = 123
#
#     expect(int_to_word(n)).to eql("one hundred and twenty three")
#   end
#
#   it "converts a two digit nunber" do
#     n = 89
#
#     expect(int_to_word(n)).to eql("eighty nine")
#   end
#
#   it "converts a single digit number" do
#     n = 7
#
#     expect(int_to_word(n)).to eql("seven")
#   end
# end
