# input = ARGV[0].upcase
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

def solution(input)

	letter_bank = input.upcase.split("").sort { |x,y| x.ord <=> y.ord }

	rank = 1
	i = 0

	while i < input.length
		order_in_letter_bank = letter_bank.index(input[i])
		add_to_rank = order_in_letter_bank * factorial(letter_bank.length - 1)
		rank = rank + add_to_rank
		letter_bank.delete_at(order_in_letter_bank)
		i = i + 1
	end

	return rank
end


def factorial(input)
	if input == 0
		return 1
	else
		return input * factorial(input-1)
	end
end

