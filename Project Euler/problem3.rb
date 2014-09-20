#What is the largest prime factor of the number 600851475143?

	#The number is odd, so the largest possible prime factor is the number/3
	#Given how large this number is, it seems like a good idea to start here and work DOWN
	#That way the first match will be the right answer

# declare variables
x = 3
	# x will be used to cycle through the small factors of 600851475143
t = (600851475143/x)
	# t will be the variable that the solution is stored to
j = 0
	# for purposes of the loop

#You want a loop here that will keep cycling until you identify a prime  factor
while (j == 0)
# is it prime?

	#Prime numbers are numbers that are evenly divisible only by 1 and themselves
	#So, we want a loop that will exit only with a prime number stored to t

	#loop to store prime numbers to t
	while (t % 2 == 0)
			x = x + 1
			t = (600851475143/x)
			# even factors are not prime
	end
	i = 3	#since primes are divisible by 1, and 2 has already been ruled out, this is the first test case
	a = Array.new	# will store all of the i's we have used
	a[0] = 2
	k = 1
	while (i <= (t/3)) 
		# we only test up to t/3 since that is always the greatest possible factor of any odd number
		# some odd numbers won't be evenly divisible by 3, but that just means their greatest factor is less than #/3
		if !((t % i) == 0) & (i == (t/3))
			j = 1
			#tells the main loop to exit: a prime factor has been found
		end
		if !((t % i) == 0) & ~(j = 1)
			a[k] = i
			k = (k + 1)
			i = i + 2 #since i is odd, and i + 1 will be even; and since t is odd, and even numbers never divide odd numbers evenly

			# we don't want to use i's that can be obtained by multiplying the previous i's we've used by whole numbers
			z = 0	
			r = 0
			while z == 0
				if (i % a[r] == 0)
					i = i + 2
					r = 0
				else
					if (r + 1) == a.length
						z = 1
					else
						r = r + 1
					end
				end

			end

		else
			# here you want to deal with the case in which the t number is not prime
			print t, " is not prime!\n"
			x = x + 1
			t = (600851475143/x) #this will move us on to the next factor of 600...
			i = (t/3)+1	#this will make the while loop end to start again with the new candidate
		end
	end
end
print "The answer is: ", t, "\n"