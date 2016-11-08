puts "Введите переменные"
a = gets.chomp.to_f
b = gets.chomp.to_f
c = gets.chomp.to_f

dis = b ** 2 - 4 * a * c
x1 = (- b + Math.sqrt(dis)) / 2 * a
x2 = (- b - Math.sqrt(dis)) / 2 * a

if dis < 0
	puts "#{dis}, корней нет!"
elsif dis > 0
  puts "#{dis}, #{x1}; #{x2}"
else
  dis == 0
  puts "#{dis}, #{x1}"
end
