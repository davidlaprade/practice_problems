# -------------------PUZZLE-1-------------------------------------------------------------------------------------------------------
# There are N people at a party. All N people are seated in a circle. Every pair of people at the party sings a song, except
# those pairs which sit adjacent to one another in the circle. Each song lasts for 2 minutes, [ multiple songs are not
# sung at the same time, and there was no intermission between songs]. If the total time singing at this party is 28min, what is N?
# ----------------------------------------------------------------------------------------------------------------------------------

# def singing_duration(n)
# 	# create array of the people
# 	circ = [*1..n]
# 	# find how many distinct pairs can be made from that array
# 	num_distinct_pairs = circ.combination(2).to_a.length
# 	# subtract from the number of distinct pairs, the number of distinct pairs that are 
# 	# composed of people sitting next to each other
# 	singing_pairs = num_distinct_pairs - n
# 	return singing_pairs * 2
# end

# # # pass in number of people at party, outputs time in minutes of singing at party
# # def singing_duration(n)
# # 	circ = [*1..n]
# # 	distinct_pairs = circ.combination(2).to_a
# # 	d = circ.dup
# # 	set1 = d.insert(0,d.last).insert(d.length,d[1]).each_slice(2).to_a
# # 	d.shift
# # 	set2 = d.each_slice(2).to_a
# # 	full_set = set1|set2
# # 	full_set.map! {|x| x.length != 2 ? nil : x}
# # 	full_set = full_set.compact
# # 	adjacent_pairs = full_set.map! {|x| x.sort}.sort
# # 	singing_pairs = distinct_pairs - adjacent_pairs
# # 	return singing_pairs.length * 2
# # end

# n = 1
# while singing_duration(n) != 28
# 	n = n + 1
# end

# print "The number of the people at the party is: #{n}\n"

# -----------------------------------------------------------------------------------------------------------------------------------


# -------------------PUZZLE-2---------------------------------------------------------------------------------------
# Let’s play a game of Russian roulette. You are tied to your chair and can’t get up. Here’s a
# gun. Here’s the barrel of the gun, six chambers, all empty. Now watch me as I put a single
# bullet in the gun. I close the barrel and spin it. I put a gun to your head and pull the trigger.
# Click. Lucky you! Now I’m going to pull the trigger one more time. Which would you prefer,
# that I spin the barrel first, or that I just pull the trigger
# ----------------------------------------------------------------------------------------------------------------------

# def loaded_gun
# 	# create array with 6 nil members
# 	chambers = Array.new(6)
# 	# place bullet in one random chamber
# 	chambers[rand(6)] = "bullet"
# 	return chambers
# end

# def loaded_gun_first_chamber_blank
# 	# create array with 6 nil members
# 	chambers = Array.new(6)
# 	# place bullet in one random chamber that's not the first
# 	chambers[rand(5)+1] = "bullet"
# 	return chambers
# end

# pull_trigger_again = 0
# spin_again = 0

# 100000.times do
# 	if loaded_gun_first_chamber_blank[1] == "bullet"
# 		pull_trigger_again = pull_trigger_again + 1
# 	end
# 	if loaded_gun[0] == "bullet"
# 		spin_again = spin_again + 1
# 	end
# end

# print "Times you would have died, pulled the trigger again: #{pull_trigger_again}\n"
# print "Times you would have died, spun again: #{spin_again}\n"

# --------------------------------------------------------------------------------------------------------------------------

# ------------------PUZZLE-3------------------------------------------------------------------------------------------------
# There is one highland where planes get fuel. A plane can cover the half of the world with full
# tank. A plane can transfer fuel from one plane to the other in the air.
# How many planes are required to make one plane cover the entire world once. Starting point of
# the travel is the Highland and coming back to the same Highland.
# All the other planes giving fuels to this Plane should also come back to the same highland and
# they don't have to cover the entire world.
# -----------------------------------------------------------------------------------------------------------------------------



# -----------------PUZZLE-4---------------------------------------------------------------------------------------------------
# One Domino (2x1) can be placed on two adjacent squares in a Chess board.
# How many Dominoes can be placed in an 8 x 8 chess board if a row is already filled and cannot
# be used for placing Dominoes?
# ------------------------------------------------------------------------------------------------------------------------------

# 28...duh?

# ------------------PUZZLE-5--------------------------------------------------------------------------------------------------------------
# A set of instructions is given that consists of a string of "L"s and "R"s, designating "left" and "right." For a number n of instructions, 
# there is a corresponding strip of paper 2^n spaces long. E.g., "LLR" corresponds to a strip of paper 8 spaces long. The spaces on the paper 
# are numbered starting at 1, and ascending in intergers. An instruction L or R means to fold the strip along its center in that direction. 
# Thus a strip numbered up to 4 and folded left would have 4 on top of 1 and 3 on top of 2. Folded left again, you have 2 on top and 3-4-1 
# underneath. For any set of instructions passed as a command-line argument, the program must provide the order of the numbers in the resulting stack.
# -------------------------------------------------------------------------------------------------------------------------------------------

# input = ARGV[0].upcase

# instructions = input.split("")
# # create array to model paper, contains arrays of each spot's number
# paper = [*1..(2 ** instructions.length)].map! { |x| [x] }

# class Array
# 	# call on an Array object modeling the paper strip, returns array modeling the paper strip if it had been folded left 
# 	def fold_left
# 		# puts the first half of the elements in the self array in the new array; this is the bottom of the stack
# 		folded_array = self.take(self.length/2)

# 		# now take the last half of the elements in the self array, starting from the last; these will be the top of the stack
# 		self.reverse.take(self.length/2).each_with_index do |member, index|
# 			# these elements are being flipped over when folded, so they have to be reversed
# 			folded_array[index] = folded_array[index].unshift(*member.reverse)
# 		end

# 		return folded_array
# 	end

# 	def fold_right
# 		# get bottom of stack
# 		folded_array = self.drop(self.length/2)

# 		# create top of stack
# 		self.take(self.length/2).reverse.each_with_index do |member, index|
# 			folded_array[index] = folded_array[index].unshift(*member.reverse)
# 		end

# 		return folded_array
# 	end
# end

# # carry out instructions
# while instructions.length > 0
# 	if instructions[0] == "L"
# 		paper = paper.fold_left
# 	elsif instructions[0] == "R"
# 		paper = paper.fold_right
# 	end
# 	instructions.shift
# end

# print "The stack would be #{paper[0]}\n"

# ------------------PUZZLE-6------------------------------------------------------------------------------------------------------------------
# Challenge taken from: http://codegolf.stackexchange.com/questions/25178/juggling-by-numbers
# You will take a siteswap pattern which contains blanks and output a valid pattern with those blank spots filled in.
# Take as input (via command-line argument) a string of the format "n s", where n is an integer indicating the number of balls to be used, 
# and s is a siteswap pattern, e.g. "333", "431", "542". You may assume that the pattern is syntactically correct, e.g. all square brackets 
# are matched and not nested, and there are no unexpected characters. All throws will be single-digit throws (0 - 9). However, some beats 
# may just be denoted as a "_", which is to be filled in with a single or a multiplex throw in the output. Note: something like "[_3]" will 
# not be part of the input. Either the entire beat is missing or the entire beat is given. Output a valid pattern, which can be juggled with 
# the given number of balls and which agrees with the input pattern in all the non-blank beats. If no valid pattern is possible with the given 
# inputs, output !. Output will also be via stdout, to a file or as a function return value. Note: The output must not contain unnecessary 
# square brackets or zeroes in multiplex throws. So outputs containing [3] or [03] are not accepted, you have to output 3 instead. The 
# order of digits in a multiplex throw is not relevant. Note: You may omit patterns that are duplicates under cyclic permutations. E.g. for 
# input "3 __" (note the two wildcards), both 42 and 24 are valid answers (among others), but they actually describe the same pattern. You 
# can either output both or just one of them, but youll have to do it consistently. This is code golf, the shortest code wins.

# Better: take a complete, syntactically correct, siteswap pattern and say whether it is semantically valid for a given number of balls. All 
# throws will be single-digit throws (0 - 9).
# ---------------------------------------------------------------------------------------------------------------------------------------------

# Notes:
# key value: number of balls in hands after a given throw
# 	-it's key because it will never be < 0
# 	-it's key because all valid patterns seem to end up with it being zero for every throw once all balls have been incoperated
# 	--you should be getting zeros for every throw by the time all of the original balls have been incorperated
# 	--but HOW DO YOU IDENTIFY THE PATTERNS THAT WILL NEVER INCORPERATE ALL OF THE BALLS???
# 	--to find: find largest throw, add its value to the length of the pattern, divide by the pattern length, round up, repeat that number of times
# 	--then look to see if the value is zero at all throws
# 	
require 'pry'
# binding.pry

num_balls = ARGV[0].to_i
siteswap_pattern = ARGV[1].split("")
print "siteswap_pattern: #{siteswap_pattern}\n"
newpattern = []
i = 0
while i < siteswap_pattern.length
	if siteswap_pattern[i].ord != 91
		newpattern << siteswap_pattern[i].to_i
		i = i + 1
	else 
		go_to = siteswap_pattern.index("]")
		arr = []
		k = i + 1
		while k < go_to
			arr << siteswap_pattern[k].to_i
			k = k +1
		end
		newpattern << arr
		i = go_to + 1
	end
end
siteswap_pattern = newpattern

# decide how many times to run the model
l = siteswap_pattern.length
repeat_num = ((l + siteswap_pattern.flatten.max.to_f)/l).ceil
pattern_to_check = siteswap_pattern * repeat_num

balls_in_hands = Array.new(pattern_to_check.length).fill(0)

# run model that many times
ball_bin = num_balls
errors = []
pattern_to_check.each_with_index do |toss, index|
	# ball(s) is(are) thrown

		# subtract values from balls_in_hands from the juggler state throwing
		toss = [toss] if toss.class != Array

		if toss[0] != 0
			num_thrown = toss.length
		else
			num_thrown = 0
		end

		if !ball_bin.zero?

			errors << "!" if (ball_bin + balls_in_hands[index]) < num_thrown
			if ball_bin < num_thrown
				balls_in_hands[index] = (balls_in_hands[index] + ball_bin) - num_thrown
				ball_bin = 0
			else
				# print "ball_bin: #{ball_bin}\n"
				# print "balls_in_hands: #{balls_in_hands}\n"
				# print "index: #{index}\n"
				ball_bin = ball_bin - num_thrown
				balls_in_hands[index] = ball_bin

			end
		else
			# remove balls from thrower

			# print "errors: #{errors}\n"
			# print "balls_in_hands: #{balls_in_hands}\n"
			# print "index: #{index}\n"
			# print "toss: #{toss}\n"
			# print "balls_in_hands[index] < toss.length: #{balls_in_hands[index] < toss.length}\n"
			errors << "!" if balls_in_hands[index] < num_thrown

			balls_in_hands[index] = balls_in_hands[index] - num_thrown
			if !balls_in_hands[index].nil? && balls_in_hands[index] < 0
				binding.pry
			end
		end

		# add values to the balls_in_hands of the juggler states recieving
		toss.each do |t| unless toss[0] == 0
			# print "balls_in_hands: #{balls_in_hands}\n"
			# print "index: #{index}\n"
			# print "t: #{t}\n"
			# print "balls_in_hands[index+t]: #{balls_in_hands[index+t]}\n"
			balls_in_hands[index+t] = balls_in_hands[index+t] + 1 if balls_in_hands[index+t] != nil
			if !balls_in_hands[index + t].nil? && balls_in_hands[index + t] < 0
				binding.pry
			end
			end
		end



end

print "ball_bin: #{ball_bin}\n"
print "repeat_num: #{repeat_num}\n"
print "pattern_to_check: #{pattern_to_check}\n"
print "errors: #{errors}\n"
print "balls_in_hands: #{balls_in_hands}\n"
print "balls_in_hands.drop(pattern_to_check.length - l): #{balls_in_hands.drop(pattern_to_check.length - l)}\n"

l = siteswap_pattern.length
if errors.include?("!")
	print "!\n"
else
	check = balls_in_hands.drop(pattern_to_check.length - l)
	if check.count(0) == l
		print "Valid!\n"
	end
end




# num_balls = ARGV[0].to_i
# siteswap_pattern = ARGV[1].split("")

# if all positions are blanks, output "3"

# there must always be enough balls to throw on any given beat
# 	if two balls are thrown on that beat, then at least two balls must have landed in that hand by that time

# class Juggler
# 	def initialize
# 		@left_hand = 0
# 		@right_hand = 0
# 	end

# 	attr_accessor :left_hand, :right_hand
# end

# class Array
# 	# called on siteswap array object containing blanks, i.e. "_"
# 	# outputs "!" if object is not juggleable, otherwise outputs a complete, juggleable siteswap array
# 	def can_be_juggled?
# 		# create an array of juggler objects, to model the juggler at each point in his throw
# 		juggler_array = []
# 		self.length.times do 
# 			juggler_array << Juggler.new
# 		end

# 		# run through the siteswap once, ignoring blanks, filling the jugglers hands as you go
# 		# throw balls until intitial stock has been depleted, then remove them from the jugglers hands
# 		# when one throw goes past the end of the loop, wrap around
# 		# if a juggler is at an even spaced index in the juggler array, he is throwing from his left hand
# 		# if a juggler is at an odd spaced index, he is throwing from his right
# 		# what if not all the balls are used by the throws listed in the siteswap pattern?
# 		ball_bin = num_balls
# 		self.each_with_index do |beat, index|
# 			# the beat is going to be a value like "1", "2", or "3"
# 			if beat != "_"
# 				if beat.class != Array
# 					beat = [beat]
# 				end

# 				beat.each do |toss|
# 					# account for ball caught
# 					# find index of juggler object "catching" the ball; mod by length in case of wrapping over
# 					catcher_index = (index + toss.to_i) % self.length

# 					catcher = juggler_array[catcher_index]
# 					# add ball to the relevant hand of catcher
# 					if (index + toss.to_i).even?
# 						catcher.left_hand = catcher.left_hand + 1
# 					else
# 						catcher.right_hand = catcher.right_hand + 1
# 					end

					
# 					# account for ball thrown
# 					if !ball_bin.zero?
# 						ball_bin = ball_bin - 1 
# 					else
# 						thrower = juggler_array[index]
# 						if index.even?
# 							thrower.left_hand = thrower.left_hand - 1
# 						else
# 							thrower.right_hand = thrower.right_hand - 1
# 						end
# 					end
# 				end

# 			end
# 		end

# 		# checks if there are zeros in the wrong places, if so, the siteswap pattern is semantically invalid
# 		if juggler_array.zeros_ok?(self) == "!"
# 			return "!"
# 		end

# 		while right_balls_in_hands?(self) == "!"
# 			if self.include?("_")
# 				# run test to remove a blank space
# 				# then recheck to see if it passes the test
# 			else
# 				return "!"
# 			end
# 		end

# 	end

# 	# called on siteswap array, passed ball_bin; modifies that array and returns the modified array object
# 	def remove_blank(ball_bin)
# 		find the first juggler which does not have enough balls to throw
# 		then use that blank to supply the ball for that juggler
# 		self.index("_")

# 	# called on array of Juggler objects, passed a siteswap pattern; return ! if zeros are not ok, otherwise return nothing
# 	def zeros_ok?(siteswap_pattern)
# 		# check if there are zeros in any arrays, if there are, return !
# 		siteswap_pattern.each do |member| unless member.class != Array
# 			member.each do |value|
# 				if value == 0
# 					return "!"
# 				end
# 			end
# 			end
# 		end

# 		# check if there are zeros at positions where there are balls in either hand; if there are, return !
# 		siteswap_pattern.each_with_index do |member, i| unless member != 0
# 			if !self[i].left_hand.zero? || !self[i].right_hand.zero?
# 				return "!"
# 			end
# 			end
# 		end

# 	end

# 	# called on array of Juggler objects, passed a siteswap pattern; return ! if too few balls in hands, otherwise return nothing
# 	def right_balls_in_hands?(siteswap_pattern)
# 		siteswap_pattern.each_with_index do |member, i| unless member == "_"
# 			# put every toss in array format to count the number of balls at each toss
# 			if member.class != Array
# 				member = [member]
# 			end
# 			# find relevant juggler object
# 			juggler = self[i]
# 			# check if juggler has enough balls to throw
# 			if i.even?
# 				return "!" if member.length > juggler.left_hand
# 			else
# 				return "!" if member.length > juggler.right_hand
# 			end
# 			end
# 		end
# 	end

# end


# test = Juggler.new(num_balls)
# print test.can_juggle?(siteswap_pattern)

