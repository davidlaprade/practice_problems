require 'benchmark'

# since Ruby doesn't contain a factorial method; returns factorial of input, i.e. (input!)
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
		# incase there are repititious characters in the input
		uniq.map! { |x| factorial(self.count(x)) }
		return factorial(length)/uniq.inject(:*)
	end
end

class Permutation
	attr_accessor :string, :order, :char_array

	def initialize(string)
		@string = string
		@char_array = string.upcase.split("")
		@order = 1
	end

	# called on Permutation object, returns alphabetical rank of Permutation.string among
	# all other strings containing the same letters
	def rank
		# creates bank of unique characters in self.char_array, then sorts them alphabetically
		letter_bank = (self.char_array&self.char_array).sort

		# base case: when self.char_array.length == 1
		if self.char_array.length == 1
			return self.order

		# inductive case: when self.char_array.length > 1
		else
			# when the input_array does NOT begin with the first-ranked letter in the letter_bank
			# we know that the string self.char_array corresponds to is alphabetically behind 
			# every unique string composed of the same letters and starting with the first-ranked letter
			# so, add the number of those unique strings to the input_array's rank
			while self.char_array.first != letter_bank.first
				dup_array = self.char_array.dup
				# find out how many unique strings begining with the first-ranked letter 
				# can be generated from the letters in self.char_array, add this to the input_array's rank
				dup_array.delete_at( dup_array.index(letter_bank.first) || dup_array.length)
				self.order = self.order + dup_array.count_uniq_permutations
				# now repeat the process above until there are no letters in the letter_bank ranked before self.char_array.first
				letter_bank.shift
			end
			# now repeat for the next character in the char_array
			self.char_array.shift
			self.rank
		end
	end

end


# gets input from command line argument
input = Permutation.new(ARGV[0])

# print formatted results to standard out
print "Rank of #{input.string}: #{input.rank}\n"
print "Run time: %f seconds\n" % Benchmark.realtime { input.rank }.to_f
pid, size = `ps ax -o pid,rss | grep -E "^[[:space:]]*#{$$}"`.strip.split.map(&:to_i)
print "Memory used: %f GB\n" % (size/1000000).to_f
