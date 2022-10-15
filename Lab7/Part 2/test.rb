require 'minitest/autorun'
require_relative 'main'

# Class tester
class Test < Minitest::Test
  def test_hierarchy
    quadrilateral = Quadrilateral.new(3, 4, 3, 4, 5)
    assert_kind_of Triangle, quadrilateral
  end

  def test_area_triangle
    triangle = Triangle.new(3, 4, 5)
    assert_in_epsilon triangle.area, 6.0, 0.001, 'Площадь треугольника вычислена неправильно'
  end

  def test_area_quadrilateral
    quadrilateral = Quadrilateral.new(3, 4, 3, 4, 5)
    assert_in_epsilon quadrilateral.area, 12.0, 0.001, 'Площадь четырехугольника вычислена неправильно'
  end
end
