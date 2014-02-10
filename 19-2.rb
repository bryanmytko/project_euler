require 'date'
start_date, end_date = Date.new(1901,1,1), Date.new(2000,12,31)
puts (start_date..end_date).select { |d| d.day == 1 && d.wday == 6 }.length