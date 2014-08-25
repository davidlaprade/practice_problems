every_combination = %w[a b b b b c d d d].permutation.map &:join

i = 0
while i < every_combination.length
	k = i + 1
	while k < every_combination.length
		if every_combination[i] == every_combination[k]
			every_combination.delete_at(k)
		else
			k = k + 1
		end
	end
	i = i + 1
end

print every_combination.length

