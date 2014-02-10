a = Array.new
#not needed, original solution... @b = Hash[('a'..'z').map.with_index.to_a]

file = File.open("names.txt","r")

while(line = file.gets)
  a = line.split(",").map! { |m| m.gsub(/"/,'') }.sort
end

def charVal(string)
  val = 0
  string.split("").each do |s|
    val += s.ord - 64 #added this after, more clever way of getting values w/o hash
  end
  val
end

total = 0

(0..a.size-1).each do |l|
  total += charVal(a[l]) * (l+1)
end

puts total
