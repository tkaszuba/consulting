def mcCount(iter)
    hits = 0 
    for i in 0..iter 
      x = Random.rand
      y = Random.rand
      if (x*x + y*y < 1)
        hits = hits + 1
      end  
    end
    hits
end

def monteCarloPiSeq(iter)
  4.0 * mcCount(iter)/iter
end

def monteCarloPiPar(iter)
  pi1=Thread.new{Thread.current[:output] = mcCount(iter/4)}
  pi2=Thread.new{Thread.current[:output] = mcCount(iter/4)}
  pi3=Thread.new{Thread.current[:output] = mcCount(iter/4)}
  pi4=Thread.new{Thread.current[:output] = mcCount(iter-3*(iter/4))}
  pi1.join
  pi2.join
  pi3.join
  pi4.join
  4.0 * (pi1[:output] + pi2[:output] + pi3[:output] + pi4[:output]) / iter
end

def monteCarloPiPar2(iter, proc=false)
  require "parallel"
  c1 = lambda {|x| mcCount(x/4)}
  c2 = lambda {|x| mcCount(x-3*(x/4))} 
  res = (!proc) ? Parallel.map([c1,c1,c1,c2], in_threads: 4) { |x| x.yield(iter) } :
      Parallel.map([c1,c1,c1,c2], in_processes: 4) { |x| x.yield(iter) }
  4.0 * (res[0] + res[1] + res[2] + res[3]) / iter  
end

def run(&block)
 start = Time.now 
 yield
 finish = Time.now
 puts "Time: #{finish - start}"
end

i = 20000000

run {puts "Sequential: #{monteCarloPiSeq(i)}"}
run {puts "Sequential: #{monteCarloPiSeq(i)}"}
run {puts "Sequential: #{monteCarloPiSeq(i)}"}
run {puts "Sequential: #{monteCarloPiSeq(i)}"}
run {puts "Parallel 1: #{monteCarloPiPar(i)}"} 
run {puts "Parallel 1: #{monteCarloPiPar(i)}"} 
run {puts "Parallel 1: #{monteCarloPiPar(i)}"} 
run {puts "Parallel 1: #{monteCarloPiPar(i)}"} 
run {puts "Parallel 2: #{monteCarloPiPar2(i)}"} 
run {puts "Parallel 2: #{monteCarloPiPar2(i)}"} 
run {puts "Parallel 2: #{monteCarloPiPar2(i)}"} 
run {puts "Parallel 2: #{monteCarloPiPar2(i)}"} 
run {puts "Parallel 2a: #{monteCarloPiPar2(i,true)}"} 
run {puts "Parallel 2a: #{monteCarloPiPar2(i,true)}"} 
run {puts "Parallel 2a: #{monteCarloPiPar2(i,true)}"} 
run {puts "Parallel 2a: #{monteCarloPiPar2(i,true)}"} 
