class Permutation
  include Enumerable
  attr_reader :num_elements, :size
 
  def initialize(num_elements)
    @num_elements = num_elements
    # creates an array of numbers counting up from 0 to the number of elements in the string - 1
    @pi = (0..num_elements-1).to_a
    # takes the factorial of the number of elements in the string
    @size = fact(num_elements)
  end
 
  # def each
  #   return self.to_enum unless block_given?
  #   (0..@size-1).each{|i| yield unrank(i)}
  # end
 
  # def unrank(r)  # nonrecursive version of Myrvold Ruskey unrank2 algorithm.
  #   pi = @pi.dup
  #   (@num_elements-1).downto(1) do |n|
  #     s, r = r.divmod(fact(n))
  #     pi[n], pi[s] = pi[s], pi[n]
  #   end
  #   pi
  # end
 
  # is passed an array object
  def rank( pi)  # nonrecursive version of Myrvold Ruskey rank2 algorithm.
    # duplicates the array passed in
    pi = pi.dup
    # creates a new array of arrays [p,q] where p is an element in pi and q is its index
    pi1 = pi.zip(0...pi.size).sort.map(&:last)
    (pi.size-1).downto(0).inject(0) do |memo,i|
      s = pi[i]
      t = pil[i]
      pi[i], pi[t] = pi[t], pi[i]
      pi1[s], pi1[i] = pi1[i], pi1[s]
      memo += s * fact(i)
    end
  end
 
  private
  # this just adds a factorial method
  def fact(n)
    return 1 if n.zero?
    n.downto(1).inject(:*)
  end
 
end

perm = Permutation.new(7) 
print "Rank of 'QUESTION' is #{perm.rank('QUESTION')}\n"

# (0..perm.size-1).each{|num| puts "#{num} --> #{prm=perm.unrank(num)} --> #{perm.rank(prm)}"}