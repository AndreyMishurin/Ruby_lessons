puts "Введите переменные"
a = gets.chomp.to_f
b = gets.chomp.to_f
c = gets.chomp.to_f

dis = b ** 2 - 4 * a * c
puts "Дискриминант = #{dis}"

if dis >= 0
  x1 = (- b + Math.sqrt(dis)) / 2 * a
  puts "Корень 1 = #{x1}"

  if dis > 0
    x2 = (- b - Math.sqrt(dis)) / 2 * a
    puts "Корень 2 = #{x2}"
  end
else
  puts "Корней нет!"
end
