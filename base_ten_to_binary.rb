require 'benchmark'
input = ARGV[0].to_i

# ----------------ITERATIVE SOLUTION------------------------

def to_binary(input)
	i = 0
	output = [0]

	while input > 0
		if input >= (2 ** i)
			i = i + 1
		else
			k = i - 1
			while k >= 0
				if input - (2 ** k) >= 0
					output[k] = 1
					input = input - (2 ** k)
					k = k - 1
				else
					output[k] = 0
					k = k - 1
				end
			end
		end
	end

	output = output.join(",").delete(",")
	return output
end

# -----------------RECURSIVE SOLUTION-----------------------------

def binary_array(number, output)
	# base case
	if number < 2
		output[0] = number
	# inductive case
	else
		# get largest base-2 number that is less than input
		k = Math.log2(number).floor
		output[k] = 1
		binary_array((number - 2**k),output)
	end
	return output
end

def to_binary_string(number)
	num_in_binary = []
	# get binary number as array
	num_in_binary = binary_array(number,num_in_binary)
	# replace 'nil' values in array with zeros
	num_in_binary.map! { |x| x == nil ? 0 : x }
	# turn array into string, delete commas
	num_in_binary = num_in_binary.join(",").delete(",")
	return num_in_binary
end
# -------------------------------------------------------------------

print "#{to_binary_string(input)} \n"
print "#{to_binary(input)} \n"
print Benchmark.measure { to_binary_string(input) }
print Benchmark.measure { to_binary(input) }
