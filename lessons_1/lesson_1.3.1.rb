puts "Введите первую сторону треугольника:"
a = gets.chomp.to_f

puts "Введите вторую сторону треугольника:"
b = gets.chomp.to_f

puts "Введите третью сторону треугольника:"
c = gets.chomp.to_f

unless a == b && b == c
    if a > b && a > c
      hypotenuse = a
      side_1 = b
      side_2 = c
    elsif b > a && b > c
      hypotenuse = b
      side_1 = a
      side_2 = c
    else
      hypotenuse = c
      side_1 = a
      side_2 = b
    end

    if hypotenuse**2 == side_1**2 + side_2**2
      puts 'Треугольник прямоугольный'
      
      if side_1 == side_2
        puts 'Треугольник равнобедренный'  
      end
    end
  end