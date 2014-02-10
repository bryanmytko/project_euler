# Binomial Coefficent
# (2n)! / n! * n!
puts (2*20).downto(1).inject(:*) / 20.downto(1).inject(:*)**2