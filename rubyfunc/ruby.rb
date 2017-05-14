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

puts sumInts(1,2)
puts sumSquares(1,2)
puts sumPowersOfTwo(1,2)

def sum (a,b,&fcn)
  if (a>b)
    0
  else
    yield(a) + sum(a+1,b,&fcn)
  end
end

puts sum(1,2){|x|x} #<--- Anonymous function
puts sum(1,2){|x|x*x}
puts sum(1,2){|y|
  def powerOfTwo(x)
    if (x == 0)
      1
    else
      2 * powerOfTwo(x-1)
    end
  end
  powerOfTwo(y)
}

def sum2 (&fcn) 
  def sumF(a,b,&block)
    if (a>b) 
      0 
    else 
      yield(a) + sumF(a+1,b,&block) 
    end
  end
  lambda {|a,b| sumF(a,b,&fcn)}
end

sumInts2 = sum2{|x|x}
sumSquare2 = sum2{|x|x*x}

puts sumInts2.yield(1,2)
puts sumInts2.yield(1,2)

puts sum2{|x|x}.yield(1,2) #<-- currying
