arr = ('A'..'Z').to_a

hash = {}
short_arr = %w[ A E I O U Y ]

arr.each_with_index do |letter, index|
  hash[:"#{letter}"] = index + 1 if short_arr.include?(letter)
end

puts hash
