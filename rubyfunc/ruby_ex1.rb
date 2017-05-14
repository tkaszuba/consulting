def sumInts(a,b)
  sum = 0
  while a <= b  do
    sum = sum + a
    a = a + 1
  end
  sum
end

puts "sumInts(1,2) = #{sumInts(1,2)}"

def sumSquares(a,b)
  sum = 0
  for i in a..b
    sum = sum + i*i
  end
  sum  
end

puts "sumSquares(1,2) = #{sumSquares(1,2)}"

def sumPowersOfTwo(a,b)
  sum = 0
  for i in a..b
    x = 1
    for j in i..b
      x = x*2
    end
    sum = sum + x   
  end
  sum
end

puts "sumPowersOfTwo(1,2) = #{sumPowersOfTwo(1,2)}"
