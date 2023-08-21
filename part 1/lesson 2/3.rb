fib = [0,1]
loop do
  fib << fib[-1] + fib[-2]
  break if fib[-1] + fib[-2] > 100
end
print fib