# ----------------------PROBLEM--------------------------------------------------------------------------------------------------------
# Two teams are playing a game. This game has rounds, and each team gets a score on a given round. There are three possible scores: 0,
# 1, and 2. And the probability that any given team will get any given score on a given round is as follows: P(0) = 0.5, P(1) = 0.3, and
# P(2) = 0.2. The scores of each team are independent of one another; i.e. the score of team A in round 1 does not depend on the score of
# team B during round 1 (or round 0, or round 2...). Given this information, write a function which takes as input two integers n and m, 
# and gives as output a list of the m-most probable score combinations of these two teams when n rounds are played.
# ----------------------------------------------------------------------------------------------------------------------------------------

# get number of rounds from user
input_rounds = ARGV[0].to_i
num_outputs = ARGV[1].to_i

# pass in a number of rounds, generate array of the probabilities of each score after that number of rounds
# the score corresponds to the index in the array, e.g. the value at position 0 is the probability of having a score of 0 at that round
def prob_array(num_rounds)
	# the key thing to notice is this: the probability of having a total score of T by the end of round R, i.e. P(T,R), is equal to:
	# P(T,R-1)*L(0) + P(T-1,R-1)*L(1) + P(T-2,R-1)*L(2), where L(n) designates the probability of getting n points in round R.
	# The second thing to notice is this: the number of possible scores after n rounds is equal to 2n + 1.
	# The third thing to notice is this: at round zero, every possible score will have zero probability.
	# You can then use the formula above to generate an array of the probabilies of each possible score at each round
	if num_rounds > 0
		prob_array = Array.new((2*num_rounds)+1).fill(0)
		prob_array[0] = 0.5
		prob_array[1] = 0.3
		prob_array[2] = 0.2

		i = 1
		while i < num_rounds
			last_array = prob_array.dup

			prob_array.each_with_index do |prob, index|

				val_to_add = (last_array[index].to_f*0.5)

				if index - 1 > 0
					val_to_add = val_to_add + (last_array[index-1].to_f*0.3)
				end

				if index - 2 > 0
					val_to_add = val_to_add + (last_array[index-2].to_f*0.2)
				end

				prob_array[index] = val_to_add
			end

			i = i + 1
		end
		return prob_array
	else
		return [0, 0, 0]
	end

end

# sort the probability array by decreasing probability, retaining the index/score information
ranked_probabilities = prob_array(input_rounds).each_with_index.map { |x,i| [i, x]}.sort {|x,y| y[1] <=> x[1]}

# generate the top m most likely score combinations
combinations = []
array_to_shift = ranked_probabilities.dup
num_outputs.times do
	combinations << [array_to_shifts[0][0], array_to_shifts[0][0]]
	array_to_shifts.shift
end

# print result to standard out
print "ranked_probabilities : #{ranked_probabilities }\n\n"
print "#{num_outputs} most likely score combos : #{combinations}\n"
