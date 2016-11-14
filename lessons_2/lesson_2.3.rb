nums = [0, 1]

while true
  n = nums[-1] + nums[-2]

  if n <= 100
    nums << n
  else
    break
  end
end

puts nums

