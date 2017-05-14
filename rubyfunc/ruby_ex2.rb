def sumInts(a,b) 
  if a > b
    0
  else
    a + sumInts(a+1,b)
  end
end

def sumSquares(a,b)
  def square(x)
    x*x
  end
  
  if (a>b)
    0
  else
    square(a) + sumSquares(a+1,b)
  end
end

def sumPowersOfTwo(a,b)
  def powerOfTwo(x)
    if (x == 0)
      1
    else
      2 * powerOfTwo(x-1)
    end
  end

  if (a >b) 
    0
  else
    powerOfTwo(a) + sumPowersOfTwo(a+1,b)
  end
end

puts "sumInts(1,2) = #{sumInts(1,2)}"
puts "sumSquares(1,2) = #{sumSquares(1,2)}"
puts "sumPowersOfTwo(1,2) = #{sumPowersOfTwo(1,2)}"
