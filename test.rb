require 'benchmark'

input = ARGV[0]

def solution(input)
	# gets every permutation of the input string, stores it to an array
	every_combination = input.upcase.split("").sort.permutation.map &:join
	# removes all non-unique members
	every_combination = every_combination & every_combination
	return every_combination.index(input.upcase) + 1
end

# print "Number of distinct strings: #{every_combination.length}\n"
print "First ranked string: #{input.upcase.split("").sort.join("").to_s}\n"
print "Rank of #{input.upcase}: #{solution(input)}\n"
print "Run time: %f seconds\n" % Benchmark.realtime { solution(input) }.to_f
pid, size = `ps ax -o pid,rss | grep -E "^[[:space:]]*#{$$}"`.strip.split.map(&:to_i)
print "Memory used: #{size/1000000}GB\n"



