$LOAD_PATH << '.'
require 'athena_health'
# require 'test'

describe "count_uniq_permutations(array)" do

	it "should output 1 when passed A" do
		input = "A".split("")
		expect(count_uniq_permutations(input)).to eq(1)
	end

	it "should output 1 when passed AAAAAAAAAAAAAA" do
		input = "AAAAAAAAAAAAAA".split("")
		expect(count_uniq_permutations(input)).to eq(1)
	end

	it "should output 14 when passed AAAAAAAAAAAAAB" do
		input = "AAAAAAAAAAAAAB".split("")
		expect(count_uniq_permutations(input)).to eq(14)
	end

	it "should output 90 when passed AABBCC" do
		input = "AABBCC".split("")
		expect(count_uniq_permutations(input)).to eq(90)
	end

	it "should output 1680 when passed AAABBBCCC" do
		input = "AAABBBCCC".split("")
		expect(count_uniq_permutations(input)).to eq(1680)
	end

	# should output the same thing as previous when input letters are scrambled
	it "should output 1680 when passed BCABACABC" do
		input = "BCABACABC".split("")
		expect(count_uniq_permutations(input)).to eq(1680)
	end

	it "should output 7821830016000 when passed AAAAAABBBCCCDEEEFGHH" do
		input = "AAAAAABBBCCCDEEEFGHH".split("")
		expect(count_uniq_permutations(input)).to eq(7821830016000)
	end

end



describe "rank" do
	# it should work when there are no repeated letters
	it "should return 21 when passed DBAC" do
		input = "DBAC".split("")
		expect(rank(input,1)).to eq(21)
		expect(Benchmark.realtime { rank(input,1) }).to be < 0.5
	end

	# it should work when there are repeated letters
	it "should return 2 when passed ABAB" do
		input = "ABAB".split("")
		expect(rank(input,1)).to eq(2)
		expect(Benchmark.realtime { rank(input,1) }).to be < 0.5
	end
	
	it "should return 1 when passed AAAAAAAAAAAAAAAAAAAAAAAAAAAA" do
		input = "AAAAAAAAAAAAAAAAAAAAAAAAAAAA".split("")
		expect(rank(input,1)).to eq(1)
		expect(Benchmark.realtime { rank(input,1) }).to be < 0.5
	end

	it "should return 1 when passed AAAB" do
		input = "AAAB".split("")
		expect(rank(input,1)).to eq(1)
		expect(Benchmark.realtime { rank(input,1) }).to be < 0.5
	end

	it "should return 4 when passed BAAA" do
		input = "BAAA".split("")
		expect(rank(input,1)).to eq(4)
		expect(Benchmark.realtime { rank(input,1) }).to be < 0.5
	end


	it "should return 24572 when passed QUESTION" do
		input = "QUESTION".split("")
		expect(rank(input,1)).to eq(24572)
		expect(Benchmark.realtime { rank(input,1) }).to be < 0.5
	end

	it "should return 10743 when passed BOOKKEEPER" do
		input = "BOOKKEEPER".split("")
		expect(rank(input,1)).to eq(10743)
		expect(Benchmark.realtime { rank(input,1) }).to be < 0.5
	end

	it "should return 8222334634 when passed NONINTUITIVENESS" do
		input = "NONINTUITIVENESS".split("")
		expect(rank(input,1)).to eq(8222334634)
		expect(Benchmark.realtime { rank(input,1) }).to be < 0.5
	end

	# it should return the same as before when capitolization is changed
	it "should return 8222334634 when passed NoNINTUitIVEnesS" do
		input = "NoNINTUitIVEnesS".split("")
		expect(rank(input,1)).to eq(8222334634)
		expect(Benchmark.realtime { rank(input,1) }).to be < 0.5
	end


end

# describe Object, ".solution" do
# 	# it should work when there are no repeated letters
# 	it "should return 21 when passed DBAC" do
# 		input = "DBAC"
# 		expect(solution(input)).to eq(21)
# 		expect(Benchmark.realtime { solution(input) }).to be < 0.5
# 	end

# 	# it should work when there are repeated letters
# 	it "should return 2 when passed ABAB" do
# 		input = "ABAB"
# 		expect(solution(input)).to eq(2)
# 		expect(Benchmark.realtime { solution(input) }).to be < 0.5
# 	end
		
# 	it "should return 1 when passed AAAB" do
# 		input = "AAAB"
# 		expect(solution(input)).to eq(1)
# 		expect(Benchmark.realtime { solution(input) }).to be < 0.5
# 	end

# 	it "should return 4 when passed BAAA" do
# 		input = "BAAA"
# 		expect(solution(input)).to eq(4)
# 		expect(Benchmark.realtime { solution(input) }).to be < 0.5
# 	end


# 	it "should return 24572 when passed QUESTION" do
# 		input = "QUESTION"
# 		expect(solution(input)).to eq(24572)
# 		expect(Benchmark.realtime { solution(input) }).to be < 0.5
# 	end

# 	it "should return 10743 when passed BOOKKEEPER" do
# 		input = "BOOKKEEPER"
# 		expect(solution(input)).to eq(10743)
# 		expect(Benchmark.realtime { solution(input) }).to be < 0.5
# 	end

	# it "should return 8222334634 when passed NONINTUITIVENESS" do
	# 	input = "NONINTUITIVENESS"
	# 	expect(solution(input)).to eq(8222334634)
	# 	Benchmark.realtime { solution(input) }.should be < 0.5
	# end


# end
