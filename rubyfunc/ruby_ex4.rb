def sum (a,b,&fcn)
  if (a>b)
    0
  else
    yield(a) + sum(a+1,b,&fcn)
  end
end

puts "sumInts(1,2) = #{sum(1,2){|x|x}}" #<--- Anonymous function
puts "sumSquares(1,2) = #{sum(1,2){|x|x*x}}"
puts "sumPowersOfTwo(1,2) = #{sum(1,2){|y|
  def powerOfTwo(x)
    if (x == 0)
      1
    else
      2 * powerOfTwo(x-1)
    end
  end
  powerOfTwo(y)
}}"

