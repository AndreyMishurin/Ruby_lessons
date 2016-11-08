
puts "Привет, как тебя зовут?"
name = gets.chomp

puts "#{name}, какой твой рост?"
height = gets.chomp.to_i

perf_height = height - 110

if height.to_i > perf_height
  puts "#{name}, твой идеальный вес #{perf_height}"
else
  puts "Ваш вес уже оптимальный"
end
