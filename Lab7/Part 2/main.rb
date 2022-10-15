# Class triangle
class Triangle
  attr_reader :side_a, :side_b, :side_c

  def initialize(side_a, side_b, side_c)
    @side_a = side_a
    @side_b = side_b
    @side_c = side_c
  end

  def print
    puts "Треугольник со сторонами #{@side_a}, #{@side_b}, #{@side_c}"
  end

  def area
    p = (@side_a + @side_b + @side_c) / 2
    Math.sqrt(p * (p - @side_a) * (p - @side_b) * (p - @side_c))
  end
end

# Class quadrilateral
class Quadrilateral < Triangle
  attr_reader :side_d, :diagonal

  def initialize(side_a, side_b, side_c, side_d, diagonal)
    super side_a, side_b, side_c
    @side_d = side_d
    @diagonal = diagonal
  end

  def print
    puts "Четырехугольник со сторонами #{@side_a}, #{@side_b}, #{@side_c}, #{@side_d}, и диагональю #{@diagonal}"
  end

  def area
    p1 = (@side_a + @side_b + @diagonal) / 2
    area1 = Math.sqrt(p1 * (p1 - @side_a) * (p1 - @side_b) * (p1 - @diagonal))
    p2 = (@side_c + @side_d + @diagonal) / 2
    area2 = Math.sqrt(p2 * (p2 - @side_c) * (p2 - @side_d) * (p2 - @diagonal))
    area1 + area2
  end
end
