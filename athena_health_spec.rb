$LOAD_PATH << '.'
# require 'athena_health'
require 'test'

describe Object, ".solution" do
	# it should work when there are no repeated letters
	it "should return 21 when passed DBAC" do
		input = "DBAC"
		expect(solution(input)).to eq(21)
		expect(Benchmark.realtime { solution(input) }).to be < 0.5
	end

	# it should work when there are repeated letters
	it "should return 2 when passed ABAB" do
		input = "ABAB"
		expect(solution(input)).to eq(2)
		expect(Benchmark.realtime { solution(input) }).to be < 0.5
	end
		
	it "should return 1 when passed AAAB" do
		input = "AAAB"
		expect(solution(input)).to eq(1)
		expect(Benchmark.realtime { solution(input) }).to be < 0.5
	end

	it "should return 4 when passed BAAA" do
		input = "BAAA"
		expect(solution(input)).to eq(4)
		expect(Benchmark.realtime { solution(input) }).to be < 0.5
	end


	it "should return 24572 when passed QUESTION" do
		input = "QUESTION"
		expect(solution(input)).to eq(24572)
		expect(Benchmark.realtime { solution(input) }).to be < 0.5
	end

	it "should return 10743 when passed BOOKKEEPER" do
		input = "BOOKKEEPER"
		expect(solution(input)).to eq(10743)
		expect(Benchmark.realtime { solution(input) }).to be < 0.5
	end

	it "should return 8222334634 when passed NONINTUITIVENESS" do
		input = "NONINTUITIVENESS"
		expect(solution(input)).to eq(8222334634)
		Benchmark.realtime { solution(input) }.should be < 0.5
	end


end
