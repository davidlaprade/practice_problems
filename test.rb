require 'benchmark'

input = ARGV[0]

def solution(input)
	# gets every permutation of the input string, stores it to an array
	every_combination = input.upcase.split("").sort.permutation.map &:join
	# removes all non-unique members
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
print "Run time: #{Benchmark.realtime { solution(input) }}\n"
pid, size = `ps ax -o pid,rss | grep -E "^[[:space:]]*#{$$}"`.strip.split.map(&:to_i)
print "Memory used: #{size/1000000}GB\n"



