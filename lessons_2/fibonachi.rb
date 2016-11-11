x = 1
y = 0
fib = ->(x, y) { return x + y }
arr = []

(0..100).each do |pos|
  if pos == 0
    arr.push(0)
  elsif pos == 1
    arr.push(1)
  else
    arr << fib.call(arr[pos - 1], arr[pos - 2])
  end
end

arr.delete(0)
