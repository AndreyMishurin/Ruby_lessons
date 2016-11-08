puts "Введите переменные"
a = gets.chomp.to_f
b = gets.chomp.to_f
c = gets.chomp.to_f

discriminant = b ** 2 - 4 * a * c 


if discriminant < 0
	puts "#{discriminant}, корней нет!"
elsif discriminant > 0
	x1 = (- b + Math.sqrt(discriminant)) / 2 * a
    x2 = (- b - Math.sqrt(discriminant)) / 2 * a
    puts "#{discriminant}, #{x1}; #{x2}"
else discriminant == 0
    x1 = (- b + Math.sqrt(discriminant)) / 2 * a
    puts "#{discriminant}, #{x1}"
end       
