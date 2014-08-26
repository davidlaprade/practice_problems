require 'benchmark'

input = ARGV[0]

def solution(input)
	every_combination = input.upcase.split("").sort.permutation.map &:join
	every_combination = every_combination & every_combination
	return every_combination.index(input.upcase) + 1
end

# i = 0
# while i < every_combination.length
# 	k = i + 1
# 	while k < every_combination.length
# 		if every_combination[i] == every_combination[k]
# 			every_combination.delete_at(k)
# 		else
# 			k = k + 1
# 		end
# 	end
# 	i = i + 1
# end

# print "Number of distinct strings: #{every_combination.length}\n"
print "Rank of #{input.upcase}: #{solution(input)}\n"
print Benchmark.measure { solution(input) }


