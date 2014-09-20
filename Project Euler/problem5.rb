#Finds the lowest number that each of 1-20 divides evenly

#initialize/declare variables
x = 20
	# the variable to be used to find the target number
	# start at 20 since it's the first number that is evenly divided by 20
a = 20
	# the variable to be used to run the mod function
	# check will start at 20 and work down to avoid wasting time on small numbers

#create loop which will repeat the check method until the right answer is stored in x

while (a > 11) 	#11 since anything that is divided evenly by each of 20-11 wil be divided evenly by each of 10-1
				# if X mod Y == 0, then any number Z that evenly divides Y also evenly divides X
	r = (x % a) #r stores the remainder of x/a
	if (r == 0)
		a = a - 1
	else
		c = (x % 20)
		x = (x + (20 - c)) #loop resets and skips ahead to the next multiple of 20
		a = 19 #19 because we already know x will be divisible by 20!
	end
end

# print the right answer
print "The lowest number that each of 1-20 divides evenly is: ", x, "\n"
