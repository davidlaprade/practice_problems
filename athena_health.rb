require 'benchmark'

# gets input from command line argument
input = ARGV[0]

# creates an array containing the characters in the input, makes them upper case
input_ary = input.upcase.split("")
rank = 1

# since Ruby doesn't contain a factorial method; returns factorial of input, i.e. (input!)
def factorial(input)
	if input == 0
		return 1
	else
		return input * factorial(input-1)
	end
end

# takes array of characters as input, outputs total number of UNIQUE permutations of those characters
def count_uniq_permutations(array)
	length = array.length
	# get array of unique members
	uniq = array & array
	# incase there are repititious characters in the input
	uniq.map! { |x| factorial(array.count(x)) }
	return factorial(length)/uniq.inject(:*)
end

# takes array of characters and integer as input; when passed an array and the integer 1,
# returns rank of input array, if input array were a string alphabetically ranked among 
# all other strings containing all and only the same letters
def rank(input_ary, initial_rank)
	# creates bank of unique characters in input_ary, then sorts them alphabetically
	letter_bank = (input_ary&input_ary).sort

	# base case: when input_ary.length == 1
	if input_ary.length == 1
		return initial_rank

	# inductive case: when input_ary.length > 1
	else
		# when the input_array does NOT begin with the first-ranked letter in the letter_bank
		# we know that the string input_ary corresponds to is alphabetically behind 
		# every unique string composed of the same letters and starting with the first-ranked letter
		# so, add the number of those unique strings to the input_array's rank
		while input_ary.first != letter_bank.first
			dup_ary = input_ary.dup
			# find out how many unique strings begining with the first-ranked letter 
			# can be generated from the letters in input_ary, add this to the input_array's rank
			dup_ary.delete_at( dup_ary.index(letter_bank.first) || dup_ary.length)
			initial_rank = initial_rank + count_uniq_permutations(dup_ary)
			# now repeat the process above until there are no letters in the letter_bank ranked before input_ary.first
			letter_bank.shift
		end
		# now repeat for the next character in the input_array
		input_ary.shift
		rank(input_ary, initial_rank)
	end
end

# print formatted results to standard out
print "Rank of #{input}: #{rank(input_ary,rank)}\n"
print "Run time: %f seconds\n" % Benchmark.realtime { rank(input_ary,rank) }.to_f
pid, size = `ps ax -o pid,rss | grep -E "^[[:space:]]*#{$$}"`.strip.split.map(&:to_i)
print "Memory used: %f GB\n" % (size/1000000).to_f

