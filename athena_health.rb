require 'benchmark'

# array = input.split("").sort { |x,y| x.ord <=> y.ord }

# this is going to work like a factorial
# the number of total combinations of the letters is going to be the factorial of input.length
# 	so, if input.length == 5, then the number of total combinations = 5 * 4 * 3 * 2 * 1

# this suggests a way to rank the words alphabetically:
# 	1. create a letter bank with each letter in the word; then check the first character
# 	2. where does it rank alphabetically in the letter bank?
# 		3. take the number of its rank, save it
# 		4. remove the first character from the letter bank
# 	5. repeat 2-4 for each remaining character in the string, each time taking out a letter from the letter bank
# 	6. multiply the rank numbers together to get the rank of the string

	

# letter_bank = input.upcase.split("").sort { |x,y| x.ord <=> y.ord }

# rank = 1
# input.split("").each do |char|
# 	order_in_letter_bank = letter_bank.index(char) + 1
# 	rank = rank * order_in_letter_bank
# 	letter_bank.delete_at(order_in_letter_bank-1)
# end
# print "#{rank}\n"


# any word that starts with the second ranked letter is alphabetically behind every word that starts with the first
# 	how many words start with the first?
# 	(input.length - 1)!

# 	so, if char != letter_bank.first, add (letter_bank.length - 1 )! to rank

# any word that starts with the third ranked letter is alphabetically behind every word that starts with either the first or second
# 	how many words start with the second?
# 	the factorial of (input.lenth -1)

# 	how many words start with the first?
# 	again: the factorial of (input.lenth -1)

# So, what you want to do is this:
# 	for each member of letter bank, starting with the 1st
# 		does the character being checked in the input == that member of the letter bank?
# 			if not, find where the first character ranks in the letter_bank; set that equal to ORDER
# 				then, get ORDER * factorial(input.length - 1)
# 				then add that number to the RANK variable
# 				now delete the character from the letter bank
# 				now check the next character in the input
# 			else, 
# 				delete the character from the letter bank
# 				check the next character in the input

# -----------------------FIRST TRY----------------------------------------------------------------------------
# def solution(input)

# 	letter_bank = input.upcase.split("").sort { |x,y| x.ord <=> y.ord }

# 	rank = 1
# 	i = 0

# 	while i < input.length
# 		order_in_letter_bank = letter_bank.index(input[i])
# 		add_to_rank = order_in_letter_bank * factorial(letter_bank.length - 1)
# 		rank = rank + add_to_rank
# 		letter_bank.delete_at(order_in_letter_bank)
# 		i = i + 1
# 	end

# 	return rank
# end

# def factorial(input)
# 	if input == 0
# 		return 1
# 	else
# 		return input * factorial(input-1)
# 	end
# end

# print solution("QUESTION")

# print Benchmark.measure { solution("QUESTION") }

# -------------------------------------------------------------------------------------------------------------

# Number of distinct permutations obtainable from string S = NUM
# Take each unique character in S, let C = the number of times it occurs in S, take C!
# 	multiply all such C!'s together, take the result and divide S.length by it
# NUM = (S.length)! / (C1! x C2! x C3! . . . x Cm!), for all m unique characters in S'

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

