fib_array = [0,1]
i = 1

while i < 30
	fib_array << (fib_array[i]+fib_array[i-1])
	i = i + 1
end

# returns number in nth place of fibonacci sequence
def fib(n)
	if n < 2 && n >= 0
		return n
	elsif n >= 2
		return fib(n-2) + fib(n-1)
	end
end

print fib_array