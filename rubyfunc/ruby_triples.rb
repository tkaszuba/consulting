def pythagorean_triples
  (1..Float::INFINITY).lazy.flat_map {|z|
    (1..z).flat_map {|x|
      (x..z).select {|y|
        x**2 + y**2 == z**2
      }.map {|y|
        [x, y, z]
      }
    }
  }
end
# show first ten pythagorean triples
p pythagorean_triples.take(10).force # take is lazy, so force is needed
p pythagorean_triples.first(10)      # first is eager
# show pythagorean triples less than 100
p pythagorean_triples.take_while { |*, z| z < 100 }.force
