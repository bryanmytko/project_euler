# In the United Kingdom the currency is made up of pound (£) and pence (p). There are eight coins in general circulation:
#
# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p), and £2 (200p).
# It is possible to make £2 in the following way:
#
# 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
# How many different ways can £2 be made using any number of coins?
#
solutions = 0

(0..1).each do |£2|
    break if £2*200 > 200    
  (0..2).each do |£1|
      break if £1*100 + £2*200 > 200    
    (0..4).each do |p50|
        break if p50*50 + £1*100 + £2*200 > 200    
      (0..10).each do |p20|
          break if p20*20 + p50*50 + £1*100 + £2*200 > 200    
        (0..20).each do |p10|
            break if p10*10 + p20*20 + p50*50 + £1*100 + £2*200 > 200    
          (0..40).each do |p5|
              break if p5*5 + p10*10 + p20*20 + p50*50 + £1*100 + £2*200 > 200    
            (0..100).each do |p2|
                break if p2*2 + p5*5 + p10*10 + p20*20 + p50*50 + £1*100 + £2*200 > 200    
              (0..200).each do |p1|
                  break if p1*1 + p2*2 + p5*5 + p10*10 + p20*20 + p50*50 + £1*100 + £2*200 > 200    
                  solutions += 1 if p1*1 + p2*2 + p5*5 + p10*10 + p20*20 + p50*50 + £1*100 + £2*200 == 200    
              end
            end
          end
        end
      end
    end
  end
end

puts solutions
