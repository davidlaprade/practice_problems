#What is the largest prime factor of the number 600851475143?

	#Given how large this number is, it seems like a good idea to stt with the num/2 in the search and work DOWN
	#That way the first match will be the right answer

# declare variables
t = (600851475143/2) #we only test up to t=#/2 since the greatest possible factor of any number is that number/2
	# t will be the variable that the solution is stored to
j = 0
	# for purposes of the loop

#You want a loop here that will keep cycling until you identify a prime  factor

while (j < 1) 
	while !((600851475143 % t) == 0)
		t = t - 1
	end
	i = 2
	while (i <= (t/2))
		if !((t % i) == 0) & (i == (t/2))
			j = 1
		end
		if !((t % i) == 0)
			i = i + 1
		else
			t = t - 1
			i = 2
		end
	end
end
print t