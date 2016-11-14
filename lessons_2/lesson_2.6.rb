basket = {}

puts 'Для завершения покупок введите стоп'

loop do
  print 'Введите название товара: '
  name = gets.chomp
  break if name == 'стоп'

  print 'Введите цену: '
  price = gets.chomp.to_f

  print 'Введите количество товара: '
  count = gets.chomp.to_f
  basket[name.to_sym] = { price: price, count: count, sum: price * count }
end

sum = 0
basket.each do |key, value|
  result = value[:sum]
  puts 'Итоговая сумма за товар #{key}: #{result}'
  sum += result
end

puts basket
puts "К оплате #{sum}"
