p (100).downto(1).inject(:*).to_s.split(//).inject(0) { |t,x| t + x.to_i }
