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






