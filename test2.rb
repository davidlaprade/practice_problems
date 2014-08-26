

def factorial(input)
	if input == 0
		return 1
	else
		return input * factorial(input-1)
	end
end


	def count_uniq_permutations(array)
		length = array.length
		uniq = array & array
		uniq.map! { |x| factorial(array.count(x)) }
		return factorial(length)/uniq.inject(:*)
	end




input = "AAAAAAAAAAAAAA".split("")
print "should be 1: #{count_uniq_permutations(input)}\n"


input = "AAAAAAAAAAAAAB".split("")
print "should be 14: #{count_uniq_permutations(input)}\n"


input = "AABBCC".split("")
print "should be 120: #{count_uniq_permutations(input)}\n"


input = "AAABBBCCC".split("")
print "should be 1680: #{count_uniq_permutations(input)}\n"


input = "A".split("")
print "should be 1: #{count_uniq_permutations(input)}\n"
