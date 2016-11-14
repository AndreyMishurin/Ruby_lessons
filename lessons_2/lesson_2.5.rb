puts "Enter the day"
day = gets.chomp.to_i
puts "Enter the month"
month = gets.chomp.to_i - 1
puts "Enter the year"
year = gets.chomp.to_i

yday = 0
arr_day = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

leap = 29 if (year % 400).zero? || (year % 4).zero?

arr_day[1] = leap if leap == 29

count = 1
while count <= 11
  yday += day
  yday += arr_day[count]
  count += 1
end

puts "Это #{yday} день в этом году"
