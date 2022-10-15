require_relative 'main'

triangle = Triangle.new(3, 4, 5)
quadrilateral = Quadrilateral.new(3, 4, 3, 4, 5)

triangle.print
quadrilateral.print

puts("Площадь треугольника - #{triangle.area}")
puts("Площадь четырехугольника - #{quadrilateral.area}")
