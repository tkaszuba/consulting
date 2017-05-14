def sumInts(a,b,acc)
  if a > b
    acc
  else
    acc = acc + a
    puts "Current total = #{acc}"
    sumInts(a+1,b,acc)
  end
end

puts "sumInts(1,2,0) = #{sumInts(1,2,0)}"
