# Build associative array from file, because there are lots of numbers
start = Time.now
pyramid = Array.new
file = File.new( "67.txt","r" )
i = 0
while ( line = file.gets )
  pyramid[i] = line.split(" ").map(&:to_i)
  i += 1
end

# Start from the bottom until second to first
# Pyramid 'crushes' itself into the largest sum at the top (pyramid[0])
(pyramid.size-2).downto(0).each do |x|
  row = pyramid[x].size-1
  (0..row).each do |r|
    if pyramid[x+1][r] > pyramid[x+1][r+1]
      pyramid[x][r] = pyramid[x][r] + pyramid[x+1][r]
    else
      pyramid[x][r] = pyramid[x][r] + pyramid[x+1][r+1]
    end
  end
end

puts pyramid[0]

puts "Time elapsed: #{Time.now - start} seconds"

