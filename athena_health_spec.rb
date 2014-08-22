$LOAD_PATH << '.'
require 'athena_health'

describe Object, ".solution" do
	# it should work when there are no repeated letters
	it "should return 21 when passed DBAC" do
		input = "DBAC"
		expect(solution(input)).to eq(21)
	end

	# it should work when there are repeated letters
	it "should return 2 when passed ABAB" do
		input = "ABAB"
		expect(solution(input)).to eq(2)
	end
		
	it "should return 1 when passed AAAB" do
		input = "AAAB"
		expect(solution(input)).to eq(1)
	end

	it "should return 4 when passed BAAA" do
		input = "BAAA"
		expect(solution(input)).to eq(4)
	end

	it "should return 24572 when passed QUESTION" do
		input = "QUESTION"
		expect(solution(input)).to eq(24572)
	end

	it "should return 10743 when passed BOOKKEEPER" do
		input = "BOOKKEEPER"
		expect(solution(input)).to eq(10743)
	end

	it "should return 8222334634 when passed NONINTUITIVENESS" do
		input = "NONINTUITIVENESS"
		expect(solution(input)).to eq(8222334634)
	end

	it "should not take more than 500ms to run" do
	end

end
# Benchmark.measure