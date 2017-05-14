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
puts sumSquare2.yield(1,2)

puts sum2{|x|x}.yield(1,2) #<-- currying
