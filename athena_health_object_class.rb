# ----------------------PROBLEM------------------------------------------------------------------------------------------------------------------------
# Consider a "word" as any sequence of capital letters A-Z (not limited to just "dictionary words"). For any word with at least two different letters, 
# there are other words composed of the same letters but in a different order (for instance, STATIONARILY/ANTIROYALIST, which happen to both be 
# dictionary words; for our purposes "AAIILNORSTTY" is also a "word" composed of the same letters as these two). 
# We can then assign a number to every word, based on where it falls in an alphabetically sorted list of all words made up of the same set of letters. 
# Write a program which takes a word as a command line argument and prints to standard output its number. Do not use the method above of generating 
# the entire list. Your program should be able to accept any word 20 letters or less in length (possibly with some letters repeated), and should use 
# no more than 1 GB of memory and take no more than 500 milliseconds to run. Any answer we check will fit in a 64-bit integer. 
# Sample words, with their rank: ABAB = 2, AAAB = 1, BAAA = 4, QUESTION = 24572,  BOOKKEEPER = 10743, NONINTUITIVENESS = 8222334634.
# Your program will be judged on how fast it runs and how clearly the code is written. We will be running your program as well as reading the source 
# code, so anything you can do to make this process easier would be appreciated.
# -----------------------------------------------------------------------------------------------------------------------------------------------------

require 'benchmark'

# returns factorial of input, i.e. (input!); Ruby doesn't contain a factorial
def factorial(input)
	if input == 0
		return 1
	else
		return input * factorial(input-1)
	end
end

class Array
	# called on Array of characters, outputs total number of UNIQUE permutations of those characters
	def count_uniq_permutations
		length = self.length
		# get array of unique members
		uniq = self & self

		# when there are no repeating characters, the number of unique permutations of a string == the factorial of that string's length
		# but when there are repeating letters, there are fewer unique permutations of the string
		# for example, there are 24 unique permutations of "ABCD" but only 12 unique permutations of "AACD"--though they have the same length
		# when there are repetitions of characters, you can find the number of unique permutations by taking the factorial of the string length
		# and dividing it by the product of [for each unique character in the string, the factorial of the number of times it occurs in the string]--no easy way to say it!
		uniq.map! { |x| factorial(self.count(x)) }
		return factorial(length)/uniq.inject(:*)
	end
end

class Permutation
	attr_accessor :string, :rank, :char_array

	def initialize(string)
		@string = string
		@char_array = string.upcase.split("")
		@rank = 1
	end

	# recursive method called on Permutation object
	# returns alphabetical rank of Permutation.string among all other strings containing the same letters
	def calculate_rank
		# creates bank of unique characters in self.char_array, then sorts them alphabetically
		letter_bank = (self.char_array & self.char_array).sort

		# base case: when self.char_array.length == 1
		if self.char_array.length == 1
			# reset the char_array attribute
			self.char_array = self.string.upcase.split("")
			# terminate the loop
			return self.rank

		# inductive case: when self.char_array.length > 1
		else
			# when the char_array does NOT begin with the first-ranked letter in the letter_bank
			# we know that self.string is alphabetically behind each unique string that starts with the first-ranked letter
			# so, add the number of unique strings self.string is alphabetically behind to self.rank
			while self.char_array.first != letter_bank.first
				dup_array = self.char_array.dup
				# find out how many unique strings begining with the first-ranked letter can be generated 
				# from the letters in self.char_array, add this to the char_array's rank
				dup_array.delete_at( dup_array.index(letter_bank.first) || dup_array.length)
				self.rank = self.rank + dup_array.count_uniq_permutations
				# now repeat the process above until there are no letters in the letter_bank ranked before self.char_array.first
				letter_bank.shift
			end
			# now repeat for the next character in the char_array
			self.char_array.shift
			self.calculate_rank
		end
	end

end


# gets input from command line argument
input = Permutation.new(ARGV[0])

# passes formatted results to standard out
print "Rank of #{input.string}: #{input.calculate_rank}\n"
print "Run time: %f seconds\n" % Benchmark.realtime { input.calculate_rank }.to_f
pid, size = `ps ax -o pid,rss | grep -E "^[[:space:]]*#{$$}"`.strip.split.map(&:to_i)
print "Memory used: %f GB\n" % (size/1000000).to_f
