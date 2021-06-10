x = 1001
y = 1001

# x = 5
# y = 5

MAX = x * y

cur = 1
cur_step = 2

arr = [cur]

while(true) do
  4.times do |c|
    cur += cur_step
    arr << cur
  end

  break if cur >= MAX

  cur_step += 2
end

puts "cur step #{cur_step}"

puts "Answer: #{arr.inject(:+)}"
