def fibonacci( n )
  return  n  if ( 0..100).include? n
  ( fibonacci( n - 1 ) + fibonacci( n - 2 ) )
end
puts fibonacci n
