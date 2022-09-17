require_relative 'main'

puts(root(-1, 1, 0.001, 0) { |x| x**2 + Math.sin(x / 2) })
puts(root(0, 2, 0.001, 1) { |x| Math.atan(x) + x })
