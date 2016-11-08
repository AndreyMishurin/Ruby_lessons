puts "Чему равно основание треугольника?"
base = gets.chomp

puts "Чему равна высота треугольника?"
height = gets.chomp

area = 0.5 * base.to_i * height.to_i 

puts "Тогда площадь треугольника будет равна #{area}"