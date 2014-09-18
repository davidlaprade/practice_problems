# ------------------------PROBLEM-------------------------------------------------------------------------------------------------
# You're playing solitaire. A version of it, anyway. There is a deck of cards from which to draw. There is a discard pile. 
# And there are ten spots on which to place cards. Two rules govern how cards may be placed on the ten spots. A card 
# may be placed on a spot ONLY if (i) the spot is empty, and every spot to the left of that spot is either empty or contains a card
# lower in value, or (ii) the spot already contains a card with the same value. One card is drawn at a time, and no other cards in 
# the deck are visible. If the card you have drawn cannot be placed into a spot according to rules (i) and (ii), then it must
# be added to the discard pile. You may also choose to add a card to the discard pile if you wish. But the goal of the game is
# to have the ten spots occupied before there are 6 cards in your discard pile. If you can do that, you win.
# CHALLENGE: Write a program which models this game, and which includes an algorithm for solving it. Your algorithm will be run
# thousands of times to see if it wins more often than it loses.
# ---------------------------------------------------------------------------------------------------------------------------------

require 'pry'

cards = [*1..13]
deck = []
cards.each do |card|
	deck << Array.new(4).fill(card)
end
deck = deck.flatten

class Array
	# called on deck object, pick random numbers from deck; output card number on top
	def shuff
		if self.length == 1
			r = 0
			output = self[0]


		else
			r = rand(self.length)
			output = self[r]

		end
		self.delete_at(r)

		if output == nil
			binding.pry
		end

		return output
		print "deck: #{deck}\n"
	end

	# call on slots array, returns "yes" if all spots are occupied
	def full?
		r = "yes"
		self.each do |slot|
			if slot == nil 
				binding.pry
			end
			if slot.zero?
				r = "no"
			end
		end
		return r
	end

	# takes a deck object and run the solution algorithm
	def solve
		discard = []
		slots = Array.new(10).fill(0)
		print "self: #{self}\n"
		# check to see if each slot in array is occupied
		while slots.full? == "no" || discard.length > 5
			print "self: #{self}\n"
			card = self.shuff

			if card == nil
				binding.pry
			end


			# check to see if card is in a slot, if it is, move to next
			if !slots.include?(card)

				# put max card in farthest right available
				if card == self.max
					rev = slots.reverse
					rev[rev.index(0)] = card
					slots = rev.reverse
				end

				# put low card in furthest left available
				if card == self.min
					slots[slots.index(0)] = card
				end

				if card == 7 && slots[5] != 0
					slots[5] = card
				end

				if card == 11 && slots[8] != 0
					slots[8] = card
				end

				if card == 4 && slots[2] != 0
					slots[2] = card
				end

				if card == 5 && slots[3] != 0
					slots[3] = card
				end

				if card == 6 && slots[4] != 0
					slots[4] = card
				end

				if card == 8 && slots[6] != 0
					slots[6] = card
				end

				if (card == 9 || card == 10) && slots[7] != 0
					slots[7] = card
				end

				if (card == 2 || card == 3) && slots[1] != 0
					slots[1] = card
				end
			end


			# if the card hasn't been added to a slot at this point, and isn't already in the array, add to discard pile
			if !slots.include?(card)
				discard << card
			end

		end

		print "slots: #{slots}\n"
		print "discard: #{discard}\n"

	end
end

deck.solve




