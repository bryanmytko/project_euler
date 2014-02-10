#You are given the following information, but you may prefer to do some research for yourself.
#
#1 Jan 1900 was a Monday.
#Thirty days has September,
#April, June and November.
#All the rest have thirty-one,
#Saving February alone,
#Which has twenty-eight, rain or shine.
#And on leap years, twenty-nine.
#A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
#1 Jan 1901 Tuesday

#How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
@month_days = {
  :january => 31,
  :february => 28,
  :march => 31,
  :april => 30,
  :may => 31,
  :june => 30,
  :july => 31,
  :august => 31,
  :september => 30,
  :october => 31,
  :november => 30,
  :december => 31
}

@week = %w(monday tuesday wednesay thursday friday saturday sunday)
@start = 1 #1900 starts on a tuesday
@total_first_sundays = 0

def get_sundays( year )
  @month_days[:february] = ( year % 4 == 0 ) ? 29 : 28
  @month_days.each do |k,v|
    (1..v).each do |d|
      puts "#{d}: #{@week[@start%7]}"
      if ((d == 1) && (@start%7 == 6)) then @total_first_sundays += 1 end
      @start += 1
    end
  end
end

(1901..2000).each do |year|
  get_sundays( year )
end

p @total_first_sundays


