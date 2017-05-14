puts "sumInts(1,2) = #{(1..2).inject(0) {|sum,x| sum + x}}"        
puts "sumSquares(1,2) = #{(1..2).inject(0) {|sum,i| sum + i*i}}"
puts "sumPowersOfTwo(1,4) = #{(1..4).inject(0) {|sum,y|
  def powerOfTwo(x) 
     (x.eql? 0) ? 1 : 2*powerOfTwo(x-1)
  end
  sum + powerOfTwo(y)
}}"
puts "'simplified' sumPowersOfTwo(1,4) = #{(1..4).inject(0) {|sum,y| sum + (1..y).inject(1){|x|x*2}}}"
