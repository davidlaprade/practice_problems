fib_array = [0,1]
i = 1

while i < 30
	fib_array << (fib_array[i]+fib_array[i-1])
	i = i + 1
end

print fib_array